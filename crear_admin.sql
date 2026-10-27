-- Script para crear usuario administrador de Versyo
-- Contraseña: Qq75115154

-- Eliminar usuario admin si existe (opcional, comentado por seguridad)
-- DELETE FROM usuario WHERE email = 'versyostore@gmail.com';

-- Crear usuario administrador
INSERT INTO usuario (
    id,
    nombre,
    apellido,
    email,
    contrasena,
    dni,
    direccion,
    email_verificado,
    rol,
    telefono,
    creado_en,
    tiene_membresia
) VALUES (
    gen_random_uuid(),
    'Versyo Store',
    'Admin',
    'versyostore@gmail.com',
    '$2b$10$U/MO0xX5pfUNQdjoOL.1A.DpGP17oYLsMFEOP5zQ8hF6T0k5hVZbS', -- Contraseña: Qq75115154
    '99999999',
    'Oficina Central Versyo',
    true,
    'admin',
    '+51999999999',
    NOW(),
    true
)
ON CONFLICT (email) DO UPDATE SET
    nombre = EXCLUDED.nombre,
    apellido = EXCLUDED.apellido,
    contrasena = EXCLUDED.contrasena,
    rol = EXCLUDED.rol,
    tiene_membresia = EXCLUDED.tiene_membresia,
    email_verificado = EXCLUDED.email_verificado;

-- Verificar que se creó correctamente
SELECT id, nombre, apellido, email, rol, tiene_membresia, email_verificado, creado_en 
FROM usuario 
WHERE email = 'versyostore@gmail.com';
