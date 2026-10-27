COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
4e6e97e2-1859-4eaa-9699-c0500d0a64a7	487767e8d9644fdbefe2e70232c19c181eeaf6181ab00dce445b65d5aca46f13	2025-11-18 01:20:30.275548-05	20251118062029_initial_setup	\N	\N	2025-11-18 01:20:29.999567-05	1
44d11121-bd79-4ca4-a54d-d1ef6fae8922	c57d25330002197e84eec308b75eba143fd1c6ff7760a44c752ffce7a57791cb	2025-11-19 18:25:45.237081-05	20251119232544_add_membresia_system	\N	\N	2025-11-19 18:25:44.951817-05	1
2649523d-7047-4f34-affc-68fb372d1ae0	598f014f66e2f2f47fcda28f4c85891a56949f6e535b68377af82b5fe6eb12eb	2025-11-19 18:31:55.740467-05	20251119233155_add_membresia_system	\N	\N	2025-11-19 18:31:55.559759-05	1
61c688f4-3f7d-4eb5-bc0b-2310066319da	e4c4d6853bee8e63ffd59b55eec56f7733d5c5d00f6a29d55563d2c2cac70022	2025-11-21 20:53:37.995539-05	20251122015337_add_apellido_and_verification_code	\N	\N	2025-11-21 20:53:37.986975-05	1
0632622f-4867-44dd-b97e-9b00a9c548be	c645a8698b4f8148ab637678d4c5a335ba990929f433d21f75dcd69a4ab8095e	2025-11-21 20:56:49.68942-05	20251122015649_add_variation_image_and_color_code	\N	\N	2025-11-21 20:56:49.657552-05	1
65bab8ea-c925-4ee7-b046-965f9ac28be5	37140191c51cccf4c667b1377eff657fbc16a47c914c55bc0eee8de9d06076f5	2025-11-21 23:33:00.107917-05	20251122043300_add_genero_to_producto	\N	\N	2025-11-21 23:33:00.058842-05	1
05fa34cc-16ff-45c4-bed2-2c26cad01013	6733be11d8b509b7881f2541b89a8eb1512f62e22841d6fa0d400f28dd28708a	2025-11-22 18:54:36.439428-05	20251122235436_add_payment_voucher_fields	\N	\N	2025-11-22 18:54:36.428554-05	1
6579d337-5077-4020-9bd6-3caeacbd171e	122d743a0403e77ad7e0ed9447f5b8826f2fbdbc55612d936eff004dd13c2eec	2025-12-02 01:25:32.492957-05	20251123125247_add_activo_destacado_to_producto	\N	\N	2025-12-02 01:25:32.486862-05	1
\.
COPY public.carrito (id, usuario_id, estado, creado_en, actualizado_en) FROM stdin;
\.
COPY public.categoria (id, nombre, identificador, descripcion) FROM stdin;
1	Polos	polos	\N
\.
COPY public.cupon (id, codigo, tipo_descuento, valor_descuento, monto_minimo, descuento_maximo, usos_maximos, usos_actuales, fecha_inicio, fecha_fin, activo, creado_en) FROM stdin;
\.
COPY public.email_verification_token (id, usuario_id, token, expira_en, creado_en) FROM stdin;
\.
COPY public.item_carrito (id, carrito_id, producto_id, cantidad, precio_unitario, variacion_id) FROM stdin;
\.
COPY public.item_pedido (id, pedido_id, producto_id, cantidad, precio_unitario, variacion_id) FROM stdin;
\.
COPY public.pago_simulado (id, pedido_id, metodo, estado_pago, referencia, creado_en) FROM stdin;
\.
COPY public.password_reset_token (id, usuario_id, token, expira_en, usado, creado_en) FROM stdin;
\.
COPY public.pedido (id, usuario_id, total, estado, nombre_receptor, direccion_envio, ciudad, region, pais, telefono_contacto, codigo_tracking, agencia_envio, tiempo_estimado_entrega, cupon_id, creado_en, metodo_pago, notas, voucher_url) FROM stdin;
\.
COPY public.producto (id, nombre, descripcion, precio, imagenes, categoria_id, temporada_id, slug, creado_en, genero, activo, recomendado, precio_oferta) FROM stdin;
1	OG Black	All Colors; All Variants\n100% algodÃ³n 30/1\n	40.00	["https://res.cloudinary.com/ddwohvsft/image/upload/v1763791238/versyo/productos/rgcxnjyl6p646qpbn2lf.jpg", "https://res.cloudinary.com/ddwohvsft/image/upload/v1763791237/versyo/productos/o8jxchh1qxorq5w7dmim.jpg", "https://res.cloudinary.com/ddwohvsft/image/upload/v1763791237/versyo/productos/jtwaxotzxpgygspn80pd.jpg"]	1	1	og-black	2025-11-22 01:01:24.707-05	ambos	t	t	\N
\.
COPY public.refresh_token (id, usuario_id, token, expira_en, revocado, creado_en) FROM stdin;
7	2	ba71d7bb07c9a8a7da6433bad9d6fac3d69ec8608a74358f5f2e242ee544d7c9ebc8d24ef14b26894a371e0921ac3e7d6b563958ae588fcea468fafe79acc8b2	2025-12-21 02:15:22.75-05	f	2025-11-21 02:15:22.752-05
9	2	5c23b3da7308f550797d54e4ffc5f5cde032e9edcd706f20eeb0a4b76f1ef9b190e0190a36f2ee82fbb4d321531ea9fbec5955a8aee5641309bbfa680010e5ed	2025-12-21 17:26:51.752-05	f	2025-11-21 17:26:51.753-05
42	2	1e261f28506da2c540e720055812a770158a9efa4ab844068c205038a67b9755372d5328f1339b516e2f871b376e1877a8a812778ac23ed6f5bf5c2ea929fa60	2025-12-21 17:43:00.998-05	f	2025-11-21 17:43:01-05
44	2	42abc9178f4e500310ec5b08934d3554409b1fe3b34fe3fbc2678bd2c8ed9356f1594b3565aa00ba8d24b035e4bf5b6b2727882f09ebc0eba49ec5136fe4bd19	2025-12-21 23:02:12.041-05	f	2025-11-21 23:02:12.042-05
46	2	0699266792df5bc7ff5b8d733e68d71a2353db09548dd695e976f6a8240af881ea4684306a5367018134057bc5db6c534149c1e8fd100f5c9ba3684ff6a0325d	2025-12-22 02:01:20.852-05	f	2025-11-22 02:01:20.854-05
47	2	b7368d3232fad4c10bf0602df37cdabaecdbed139478224c3738ce923c55ce1433c8cc135ca85ff74e908684735f293c3f2474c769657f2bcece04b91a73e67b	2025-12-22 02:06:16.326-05	f	2025-11-22 02:06:16.328-05
51	2	50bd7beb3a1f0a924cd2292254cda8a42fc2562ff2a533d3d9081e3b8928468e183f8f47ab001d2603026e821161288baf639bc819c7bd39bfa7c8129e085bf5	2025-12-23 01:49:50.598-05	f	2025-11-23 01:49:50.6-05
53	2	d068d819b5783e9e4f66db0aec09c4d220c35d9a4884d4614f6616743880bb1f8f3c643227dcba2edc73ae58415ec4e0a4815a425fd9aafa552fe5d2e9f8782c	2025-12-23 01:54:33.892-05	f	2025-11-23 01:54:33.894-05
54	2	6e6abf9666fda0d937f16f32418748c270726598ccafbdd2d4145f2591c9f7acd8f87c84eaa3f7b7894fd8850cdc642d52d50844ea75644dcf4051365d374214	2025-12-23 07:42:43.096-05	f	2025-11-23 07:42:43.099-05
56	2	b2364afa33daff7a5eff2871de13eb631c0acf17d09bc352c0801264ab5bb5d9c3c641adc3018309536a773eb2f23842fca184894369a05983159531454db2c4	2025-12-23 07:44:31.796-05	f	2025-11-23 07:44:31.798-05
57	2	beaef76de528530a8ce125200dfb3edfd11171321c1d9ba5915826cc78e0493a4b4e6926b3dbe064dc4a8ab3fb0c8388b0f938348c947a91c9c861f925a4326b	2025-12-23 08:02:58.94-05	t	2025-11-23 08:02:58.943-05
59	2	72abaf80289d42a65f75533457ea32f7791e3c4f94c91d8bde4e548bceb4e845a862cd2bee7f9886bac3ed5ec4d21de02a688b13c3169d8517c27422c9b3c18f	2026-01-01 01:23:59.483-05	f	2025-12-02 01:23:59.486-05
58	2	758bbd43ecd3bc08f345f5a4e16e47ca9eff03633d66a6a2d74e6ff52672b103568f8f8ca4a340b2afad70eab16e804af533983145da7fccc9685d20c9feef60	2026-01-01 01:23:59.484-05	f	2025-12-02 01:23:59.488-05
61	2	97f24e084e0292190bc14ed74b6914ab9f32d694035a479fae43a1107c61730808f9d9ac79ef028698f0c6d1d257e379cda5f4e74b80da4319935e483130b81d	2026-01-01 01:37:02.509-05	f	2025-12-02 01:37:02.51-05
\.
COPY public.solicitud_membresia (id, usuario_id, email_solicitante, estado, boleta_url, comprobante_enviado, creado_en, procesado_en) FROM stdin;
1	2	versyostore@gmail.com	pendiente	\N	f	2025-11-21 23:24:16.424-05	\N
\.
COPY public.temporada (id, nombre, descripcion, activo, inicio, fin) FROM stdin;
1	OGBlack	\N	t	\N	\N
\.
COPY public.usuario (id, nombre, email, contrasena, dni, direccion, email_verificado, rol, telefono, creado_en, tiene_membresia, fecha_membresia, apellido, codigo_verificacion, codigo_verificacion_exp) FROM stdin;
2	Versyo Store	versyostore@gmail.com	$2b$10$PSRUxuOlfFxL4vGvtTOSFOZSPjCnPpdmy1GE6YpeYFFMYP9Us2Pjm	99999999	Oficina Central Versyo	t	admin	+51999999999	2025-11-21 02:06:20.651-05	t	\N	Admin	\N	\N
\.
COPY public.variacion_producto (id, producto_id, talla, color, stock, sku, codigo_color, imagen_url) FROM stdin;
35	1	S	Baby Rose	8	PRD-1-BAB-S	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854464/versyo/productos/jejvfbmemmmgqgju4mgv.jpg
36	1	XL	Baby Rose	6	PRD-1-BAB-XL	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/snpgq9xbs4o8bbjaxifq.jpg
38	1	M	Black	24	PRD-1-BLK-M	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854470/versyo/productos/rx8q7cnvobbyvnlue5yo.jpg
37	1	L	Black	16	PRD-1-BLK-L	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763853896/versyo/productos/yutf97ld7m67mjj792tn.jpg
33	1	L	Baby Rose	13	PRD-1-BAB-L	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/snpgq9xbs4o8bbjaxifq.jpg
34	1	M	Baby Rose	15	PRD-1-BAB-M	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/apkmcksh9ialy1t1dpho.jpg
39	1	S	Black	10	PRD-1-BLK-S	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854471/versyo/productos/srxq1x4y927luhax2npv.jpg
40	1	XL	Black	8	PRD-1-BLK-XL	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763853896/versyo/productos/yutf97ld7m67mjj792tn.jpg
\.
COPY public.wishlist (id, usuario_id, producto_id, creado_en) FROM stdin;
\.
