ALTER SCHEMA financas RENAME TO financasmigration;
ALTER SCHEMA persona RENAME TO personamigration;
ALTER SCHEMA nsview RENAME TO nsviewmigration;
ALTER SCHEMA workflow RENAME TO workflowmigration;
ALTER SCHEMA servicos RENAME TO servicosmigration;
ALTER SCHEMA crm RENAME TO crmmigration;
ALTER SCHEMA estoque RENAME TO estoquemigration;

--Corrigir conjuntos em caso de erro
UPDATE ns.conjuntos c SET codigo = (g.codigo || g.codigo), descricao = (g.codigo || g.codigo)
FROM ns.estabelecimentosconjuntos ec, ns.estabelecimentos e, ns.empresas em, ns.gruposempresariais g 
WHERE ec.conjunto = c.conjunto
AND e.estabelecimento = ec.estabelecimento
AND em.empresa = e.empresa
AND g.grupoempresarial = em.grupoempresarial
AND c.cadastro <> 13
AND c.codigo <> (g.codigo || em.codigo);
UPDATE ns.conjuntos c SET codigo = (g.codigo || g.codigo), descricao = (g.codigo || g.codigo)
FROM ns.estabelecimentosconjuntos ec, ns.estabelecimentos e, ns.empresas em, ns.gruposempresariais g 
WHERE ec.conjunto = c.conjunto
AND e.estabelecimento = ec.estabelecimento
AND em.empresa = e.empresa
AND g.grupoempresarial = em.grupoempresarial
AND c.cadastro = 13;

ALTER SCHEMA ns RENAME TO nsmigration ;