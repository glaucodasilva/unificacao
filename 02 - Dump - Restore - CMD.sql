
Primeiro

cd C:\Program Files\PostgreSQL\9.3\bin

Segundo

pg_dump -U postgres -E UTF-8 -Fc -x -O --no-tablespaces --schema=servicosmigration --schema=estoquemigration --schema=nsviewmigration --schema=workflowmigration --schema=financasmigration --schema=crmmigration --schema=personamigration --schema=nsmigration  --section=pre-data --section=data -f migracao.backup base_secundaria(Nome do banco)

Terceiro

pg_restore -U postgres -x -O --no-tablespaces -d base_primaria(Nome do Banco) migracao.backup

