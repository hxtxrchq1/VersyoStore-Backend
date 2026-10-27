// Script para generar hash de contraseña con bcrypt
const bcrypt = require('bcrypt');

const password = 'Qq75115154';
const saltRounds = 10;

bcrypt.hash(password, saltRounds, (err, hash) => {
  if (err) {
    console.error('Error al generar hash:', err);
    return;
  }
  
  console.log('\n🔐 Hash generado para contraseña: Qq75115154');
  console.log('\nHash bcrypt:');
  console.log(hash);
  console.log('\n📋 Copia este hash y úsalo en el archivo crear_admin.sql');
});
