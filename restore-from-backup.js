/**
 * Script para restaurar datos del backup SQL a Supabase
 * Extrae los datos del formato COPY y los inserta usando Prisma
 */

const fs = require('fs');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient({
  datasources: {
    db: {
      url: process.env.DATABASE_URL
    }
  }
});

async function parseAndRestore() {
  console.log('🔄 Leyendo backup...\n');
  
  const backupContent = fs.readFileSync('./backup_cleaned.sql', 'utf8');
  const lines = backupContent.split('\n');
  
  let currentTable = null;
  let dataLines = [];
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    
    // Detectar inicio de datos COPY
    if (line.startsWith('COPY public.')) {
      // Guardar datos anteriores si existen
      if (currentTable && dataLines.length > 0) {
        await insertData(currentTable, dataLines);
        dataLines = [];
      }
      
      // Extraer nombre de tabla
      const match = line.match(/COPY public\.(\w+)/);
      if (match) {
        currentTable = match[1];
        console.log(`📦 Procesando tabla: ${currentTable}`);
      }
    }
    // Detectar fin de datos
    else if (line === '\\.') {
      if (currentTable && dataLines.length > 0) {
        await insertData(currentTable, dataLines);
        dataLines = [];
        currentTable = null;
      }
    }
    // Recopilar líneas de datos
    else if (currentTable && line && !line.startsWith('--') && !line.startsWith('SET')) {
      dataLines.push(line);
    }
  }
  
  console.log('\n✅ Restauración completada');
}

async function insertData(tableName, dataLines) {
  // Ignorar tablas del sistema
  if (tableName === '_prisma_migrations' || tableName.startsWith('pg_')) {
    console.log(`   ⏭️  Saltando ${tableName} (tabla del sistema)`);
    return;
  }
  
  try {
    console.log(`   📝 Insertando ${dataLines.length} registros en ${tableName}...`);
    
    // Para cada tabla, construir los datos
    for (const line of dataLines) {
      // Los datos en formato COPY están separados por tabs
      const values = line.split('\t');
      
      // Aquí necesitarías mapear cada tabla a su modelo de Prisma
      // Por simplicidad, usaremos executeRaw
      const columns = await getTableColumns(tableName);
      const valuePlaceholders = values.map((v, i) => `$${i + 1}`).join(', ');
      const columnNames = columns.join(', ');
      
      const query = `INSERT INTO "${tableName}" (${columnNames}) VALUES (${valuePlaceholders}) ON CONFLICT DO NOTHING`;
      
      await prisma.$executeRawUnsafe(query, ...values.map(v => v === '\\N' ? null : v));
    }
    
    console.log(`   ✅ ${tableName} completado`);
  } catch (error) {
    console.error(`   ❌ Error en ${tableName}:`, error.message);
  }
}

async function getTableColumns(tableName) {
  const result = await prisma.$queryRaw`
    SELECT column_name 
    FROM information_schema.columns 
    WHERE table_name = ${tableName} 
    AND table_schema = 'public'
    ORDER BY ordinal_position
  `;
  
  return result.map(r => r.column_name);
}

// Ejecutar
parseAndRestore()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
