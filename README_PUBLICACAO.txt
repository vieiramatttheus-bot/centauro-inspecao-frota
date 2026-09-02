CENTAURO | INSPEÇÃO DE FROTA — VERSÃO OPERACIONAL

O site agora está preparado para:
1. Publicação em HTTPS.
2. QR Code apontando para o endereço público.
3. Registro central de inspeções no Supabase.
4. Upload das fotos para o Storage.
5. Histórico central das últimas inspeções.

FALTA APENAS CONFIGURAR A CONTA DO SERVIÇO:
- Criar projeto no Supabase.
- Executar SUPABASE_SCHEMA.sql no SQL Editor.
- Criar o bucket "inspecao-fotos".
- Colocar URL e anon public key em centauro_inspecao/supabase-config.js.
- Publicar a pasta centauro_inspecao em um serviço de hospedagem (Cloudflare Pages ou GitHub Pages).

IMPORTANTE:
A política SQL incluída é adequada para um protótipo interno, mas para produção recomendamos login e regras por usuário/empresa antes de liberar o sistema publicamente.
