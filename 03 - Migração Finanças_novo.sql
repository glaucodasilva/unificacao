--ns.gruposempresariais

INSERT INTO ns.gruposempresariais
            (codigo,descricao,usagrade,grupoempresarial,modogestaopatrimonial,
             modo_calculo_pmc,modocomissoes,importacao_hash,tenant,lastupdate)
SELECT gru1.codigo,gru1.descricao,gru1.usagrade,gru1.grupoempresarial,gru1.modogestaopatrimonial,
       gru1.modo_calculo_pmc,gru1.modocomissoes,gru1.importacao_hash,gru1.tenant,gru1.lastupdate
FROM   nsmigration.gruposempresariais gru1
LEFT JOIN ns.gruposempresariais gru2 ON gru1.codigo = gru2.codigo
WHERE gru2.grupoempresarial is null;

--ns.empresas

INSERT INTO ns.empresas
            (codigo,descricao,tipoidentificacao,raizcnpj,ordemcnpj,cpf,
             razaosocial,
             mascaraconta,mascaragerencial,usadv,filantropica,cnae,
             naturezajuridica,tipopagamento,tipocooperativa,tipoconstrutora,
             numerocertificado,ministerio,dataemissaocertificado,
             datavencimentocertificado,numeroprotocolorenovacao,
             dataprotocolorenovacao,datapublicacaodou,numeropaginadou,
             nomecontato,cpfcontato,telefonefixocontato,dddtelfixocontato,
             telefonecelularcontato,dddtelcelularcontato,faxcontato,
             dddfaxcontato,emailcontato,inativa,inicioexercicio,logotipo,
             imagemoriginal,infoimagem,empresa,grupoempresarial,moeda,idweb,
             perfil,inicio_atividades,tributacaopiscofins,alelonumerocontrato,
             tipopontoeletronico,multiplastabelasrubrica,numerosiafi,
             acordointernacionalisencaomulta,tiposituacaopj,tiposituacaopf,
             regimeproprioprevidenciasocial,municipioentefederativo,
             descricaoleiseguradodiferenciado,valorsubtetoexecutivo,
             valorsubtetolegislativo,valorsubtetojudiciario,
             valorsubtetotodospoderes,anosmaioridadedependenteexecutivo,
             anosmaioridadedependentelegislativo,
             anosmaioridadedependentejudiciario,
             anosmaioridadedependentetodospoderes,observacao,
             usapontoweb,entidadeeducativa,empresadetrabalhotemporario,
             entefederativo,cnpjentefederativo,subtetoentefederativo,
             valorsubtetoentefederativo,numeroregistrotrabalhotemporariomte,
             esocialativo,importacao_hash,empresa_multinota,tenant_multinotas,
             optantesegurovida,optantesegurofuneral,optantepcmso,lastupdate,
             tenant)
SELECT emp1.codigo,emp1.descricao,emp1.tipoidentificacao,emp1.raizcnpj,emp1.ordemcnpj,emp1.cpf,emp1.razaosocial,
       emp1.mascaraconta,emp1.mascaragerencial,emp1.usadv,emp1.filantropica,emp1.cnae,emp1.naturezajuridica,
       emp1.tipopagamento,emp1.tipocooperativa,emp1.tipoconstrutora,emp1.numerocertificado,
       emp1.ministerio,emp1.dataemissaocertificado,emp1.datavencimentocertificado,
       emp1.numeroprotocolorenovacao,emp1.dataprotocolorenovacao,emp1.datapublicacaodou,
       emp1.numeropaginadou,emp1.nomecontato,emp1.cpfcontato,emp1.telefonefixocontato,
       emp1.dddtelfixocontato,emp1.telefonecelularcontato,emp1.dddtelcelularcontato,emp1.faxcontato,
       emp1.dddfaxcontato,emp1.emailcontato,emp1.inativa,emp1.inicioexercicio,emp1.logotipo,
       emp1.imagemoriginal,emp1.infoimagem,emp1.empresa,emp1.grupoempresarial,emp1.moeda,emp1.idweb,emp1.perfil,
       emp1.inicio_atividades,emp1.tributacaopiscofins,emp1.alelonumerocontrato,
       emp1.tipopontoeletronico,emp1.multiplastabelasrubrica,emp1.numerosiafi,
       emp1.acordointernacionalisencaomulta,emp1.tiposituacaopj,emp1.tiposituacaopf,
       emp1.regimeproprioprevidenciasocial,emp1.municipioentefederativo,
       emp1.descricaoleiseguradodiferenciado,emp1.valorsubtetoexecutivo,
       emp1.valorsubtetolegislativo,emp1.valorsubtetojudiciario,emp1.valorsubtetotodospoderes,
       emp1.anosmaioridadedependenteexecutivo,emp1.anosmaioridadedependentelegislativo,
       emp1.anosmaioridadedependentejudiciario,emp1.anosmaioridadedependentetodospoderes,
       emp1.observacao,emp1.usapontoweb,emp1.entidadeeducativa,
       emp1.empresadetrabalhotemporario,emp1.entefederativo,emp1.cnpjentefederativo,
       emp1.subtetoentefederativo,emp1.valorsubtetoentefederativo,
       emp1.numeroregistrotrabalhotemporariomte,emp1.esocialativo,emp1.importacao_hash,
       emp1.empresa_multinota,emp1.tenant_multinotas,emp1.optantesegurovida,
       emp1.optantesegurofuneral,emp1.optantepcmso,emp1.lastupdate,emp1.tenant
FROM   nsmigration.empresas emp1
LEFT JOIN ns.empresas emp2 ON emp1.codigo = emp2.codigo
WHERE emp2.empresa is null;

--ns.estabelecimentos

ALTER TABLE nsmigration.estabelecimentos ADD COLUMN pessoa_old character varying(150);

UPDATE nsmigration.estabelecimentos est1 SET pessoa_old = pes1.pessoa, id_pessoa = null
FROM nsmigration.pessoas pes1
WHERE pes1.id = est1.id_pessoa;

INSERT INTO ns.estabelecimentos
            (codigo,descricao,tipoidentificacao,raizcnpj,ordemcnpj,cpf,caepf,
             cidade,
             inscricaoestadual,inscricaomunicipal,nomefantasia,email,site,
             tipologradouro,logradouro,numero,complemento,bairro,cep,tiposimples
             ,dddtel,telefone,dddfax,fax,bloqueado,selecionarcfop,ramoatividade,
             qualificacao,naturezapj,anofiscal,inicio_atividades,
             final_atividades,dataregistro,suframa,atividademunicipal,
             atividadeestadual,registro,representante,cpfrepresentante,
             dddtelrepresentante,telefonerepresentante,ramalrepresentante,
             dddfaxrepresentante,faxrepresentante,emailrepresentante,caixapostal
             ,ufcaixapostal,cepcaixapostal,fpas,acidentetrabalho,
             numeroproprietarios,numerofamiliares,numeroconta,tipopagamento,
             codigoterceiros,porte,fazpartepat,aliquotafilantropica,
             capitalsocial,observacao,pagapis,tipoconta,inicioexercicio,cei,
             datanascimentorepresentante,sexorepresentante,contacorrentepagadora
             ,ibge,cnae,identificacaoregistro,agencia,contador,empresa,
             estabelecimento,contribuinteipi,sindicato,tipocontroleponto,
             centralizacontribuicaosindical,nomecontato,cpfcontato,
             telefonefixocontato,dddtelfixocontato,telefonecelularcontato,
             dddtelcelularcontato,faxcontato,dddfaxcontato,emailcontato,
             excessosublimite,aliquotaaplicavel,logotipo,
             alelocodigopessoajuridica,alelonumerofilial,nisrepresentante,
             dataimplantacaosaldo,regraponto,contribuinteicms,id_centro_custo,
             centralizadorsefip,tipocaepf,indicatiocontratacaoaprendiz,
             processoaprendiz,aprendizcontratadoporintermedio,
             instituicaoeducativa,indicativocontratacaopcd,
             processocontratacaopcd,processofap,processorat,
             periodoapuracaopontoproprio,matriz,id_pessoa,codigoexterno,
             importacao_hash,estabelecimento_multinota,entidadeinscritapaa,
             desabilitado_persona,lastupdate,tenant)
SELECT est1.codigo,est1.descricao,est1.tipoidentificacao,est1.raizcnpj,est1.ordemcnpj,est1.cpf,est1.caepf,est1.cidade,
       est1.inscricaoestadual,est1.inscricaomunicipal,est1.nomefantasia,est1.email,est1.site,
       est1.tipologradouro,est1.logradouro,est1.numero,est1.complemento,est1.bairro,est1.cep,est1.tiposimples,
       est1.dddtel,est1.telefone,est1.dddfax,est1.fax,est1.bloqueado,est1.selecionarcfop,est1.ramoatividade,
       est1.qualificacao,est1.naturezapj,est1.anofiscal,est1.inicio_atividades,est1.final_atividades,
       est1.dataregistro,est1.suframa,est1.atividademunicipal,est1.atividadeestadual,est1.registro,
       est1.representante,est1.cpfrepresentante,est1.dddtelrepresentante,est1.telefonerepresentante,
       est1.ramalrepresentante,est1.dddfaxrepresentante,est1.faxrepresentante,
       est1.emailrepresentante,est1.caixapostal,est1.ufcaixapostal,est1.cepcaixapostal,est1.fpas,
       est1.acidentetrabalho,est1.numeroproprietarios,est1.numerofamiliares,est1.numeroconta,
       est1.tipopagamento,est1.codigoterceiros,est1.porte,est1.fazpartepat,est1.aliquotafilantropica,
       est1.capitalsocial,est1.observacao,est1.pagapis,est1.tipoconta,est1.inicioexercicio,est1.cei,
       est1.datanascimentorepresentante,est1.sexorepresentante,est1.contacorrentepagadora,est1.ibge,
       est1.cnae,est1.identificacaoregistro,est1.agencia,est1.contador,est1.empresa,est1.estabelecimento,
       est1.contribuinteipi,est1.sindicato,est1.tipocontroleponto,
       est1.centralizacontribuicaosindical,est1.nomecontato,est1.cpfcontato,est1.telefonefixocontato,
       est1.dddtelfixocontato,est1.telefonecelularcontato,est1.dddtelcelularcontato,est1.faxcontato,
       est1.dddfaxcontato,est1.emailcontato,est1.excessosublimite,
       est1.aliquotaaplicavel,est1.logotipo,est1.alelocodigopessoajuridica,est1.alelonumerofilial,
       est1.nisrepresentante,est1.dataimplantacaosaldo,est1.regraponto,est1.contribuinteicms,
       est1.id_centro_custo,est1.centralizadorsefip,est1.tipocaepf,est1.indicatiocontratacaoaprendiz,
       est1.processoaprendiz,est1.aprendizcontratadoporintermedio,est1.instituicaoeducativa,
       est1.indicativocontratacaopcd,est1.processocontratacaopcd,est1.processofap,est1.processorat,
       est1.periodoapuracaopontoproprio,est1.matriz,est1.id_pessoa,est1.codigoexterno,
       est1.importacao_hash,est1.estabelecimento_multinota,est1.entidadeinscritapaa,
       est1.desabilitado_persona,est1.lastupdate,est1.tenant
FROM   nsmigration.estabelecimentos est1
LEFT JOIN ns.estabelecimentos est2 ON est1.codigo = est2.codigo
WHERE est2.estabelecimento is null;

--financas.tiposcontas

INSERT INTO financas.tiposcontas
            (codigo,descricao,versao,tipoconta,tipocontainterna,tipocontapadrao,
             lastupdate,
             tenant)
SELECT tip1.codigo,tip1.descricao,tip1.versao,tip1.tipoconta,tip1.tipocontainterna,tip1.tipocontapadrao,
       tip1.lastupdate,
       tip1.tenant
FROM   financasmigration.tiposcontas tip1
LEFT JOIN financas.tiposcontas tip2 ON tip1.codigo = tip2.codigo
WHERE tip2.tipoconta is null;

--ns.layoutsrelatorios

INSERT INTO ns.layoutsrelatorios(
            deleted, folderid, itemtype, modified, size, 
            template, nome, padrao, mostramenu, sistema, padraousuario, relatorio, 
            requerente, comentarios, impressaomaladireta, emailmaladireta, 
            datacriacao, acessorestrito, versao, usuarioalterador, usuariocriador, 
            aparecepersona, aparececontabil, aparecescritta, aparecefinancas, 
            aparececrm, apareceservicos, apareceestoque, lastupdate, tenant)
SELECT lay1.deleted, lay1.folderid, lay1.itemtype, lay1.modified, lay1.size, 
       lay1.template, lay1.nome, lay1.padrao, lay1.mostramenu, lay1.sistema, lay1.padraousuario, lay1.relatorio, 
       lay1.requerente, lay1.comentarios, lay1.impressaomaladireta, lay1.emailmaladireta, 
       lay1.datacriacao, lay1.acessorestrito, lay1.versao, lay1.usuarioalterador, lay1.usuariocriador, 
       lay1.aparecepersona, lay1.aparececontabil, lay1.aparecescritta, lay1.aparecefinancas, 
       lay1.aparececrm, lay1.apareceservicos, lay1.apareceestoque, lay1.lastupdate, lay1.tenant
FROM nsmigration.layoutsrelatorios lay1
LEFT JOIN ns.layoutsrelatorios lay2 on lay1.nome = lay2.nome
WHERE lay2.layoutrelatorio is null ;

--financas.layoutscobrancas

UPDATE financasmigration.layoutscobrancas lay1 set layoutrelatorio = lay3.layoutrelatorio
FROM nsmigration.layoutsrelatorios lay2, ns.layoutsrelatorios lay3
WHERE lay3.nome = lay2.nome
AND lay2.layoutrelatorio = lay1.layoutrelatorio;

INSERT INTO financas.layoutscobrancas
            (implementacao,nome,layoutrelatorio,versao,banco,layoutcobranca,
             bloqueado,
             lastupdate,tenant)
SELECT lay1.implementacao,lay1.nome,lay1.layoutrelatorio,lay1.versao,lay1.banco,lay1.layoutcobranca,lay1.bloqueado,
       lay1.lastupdate,lay1.tenant
FROM   financasmigration.layoutscobrancas lay1
LEFT JOIN financas.layoutscobrancas lay2 ON lay1.nome = lay2.nome
WHERE lay2.layoutcobranca is null;

--financas.bancos

INSERT INTO financas.bancos
            (codigo,nome,numero,tipoimpressao,banco,codigoispb,lastupdate,
             caminhoremessacobranca,caminhoretornocobranca,caminhoremessabordero
             ,caminhoretornobordero,caminhoimportacaoconciliacao,
             caminhoboletocobranca,importacao_hash,tenant)
SELECT ban1.codigo,ban1.nome,ban1.numero,ban1.tipoimpressao,ban1.banco,ban1.codigoispb,ban1.lastupdate,
       ban1.caminhoremessacobranca,ban1.caminhoretornocobranca,ban1.caminhoremessabordero,
       ban1.caminhoretornobordero,ban1.caminhoimportacaoconciliacao,ban1.caminhoboletocobranca,
       ban1.importacao_hash,ban1.tenant
FROM   financasmigration.bancos ban1
LEFT JOIN financas.bancos ban2 on ban1.numero = ban2.numero
WHERE ban2.banco is null;

--financas.contas

INSERT INTO financas.contas
            (codigo,nome,limitenegativo,numero,digito,proximocheque,
             proximobordero,bloqueado,
             acaosaldodevedor,acaolimitenegativo,agencianumero,agenciadigito,
             agencianome,codigocontabil,saldo,limitefechamento,versao,
             considerasaldonofluxodecaixa,banco,conta,tipoconta,estabelecimento,
             codigocontabilduplicata,usarnometitular,nometitular,
             compartilhaconta,id_grupoempresarial,id_funcionario,emprestimo,
             layoutpagamento,chaveconciliacao,permitirsaldonegativo,
             usarsaldominimo,saldominimo,considerarsaldocheque,
             considerarsaldobordero,id_layoutimpressoracheque,layoutcobranca,
             id_pessoa_emprestimo,id_estabelecimento_emprestimo,banconumero,
             tipocontaemprestimo,nomegerente,considerarsaldoaviso,
             possuichequeespecial,chequeespecial,contapadrao,cpfcnpjtitular,
             postoagencia,importacao_hash,id_layoutcustodiacheque,lastupdate,
             tenant)
SELECT cont1.codigo,cont1.nome,cont1.limitenegativo,cont1.numero,cont1.digito,cont1.proximocheque,cont1.proximobordero,
       cont1.bloqueado,
       cont1.acaosaldodevedor,cont1.acaolimitenegativo,cont1.agencianumero,cont1.agenciadigito,
       cont1.agencianome,cont1.codigocontabil,cont1.saldo,cont1.limitefechamento,cont1.versao,
       cont1.considerasaldonofluxodecaixa,cont1.banco,cont1.conta,cont1.tipoconta,cont1.estabelecimento,
       cont1.codigocontabilduplicata,cont1.usarnometitular,cont1.nometitular,cont1.compartilhaconta,
       cont1.id_grupoempresarial,cont1.id_funcionario,cont1.emprestimo,cont1.layoutpagamento,
       cont1.chaveconciliacao,cont1.permitirsaldonegativo,cont1.usarsaldominimo,cont1.saldominimo,
       cont1.considerarsaldocheque,cont1.considerarsaldobordero,cont1.id_layoutimpressoracheque,
       cont1.layoutcobranca,cont1.id_pessoa_emprestimo,cont1.id_estabelecimento_emprestimo,
       cont1.banconumero,cont1.tipocontaemprestimo,cont1.nomegerente,cont1.considerarsaldoaviso,
       cont1.possuichequeespecial,cont1.chequeespecial,cont1.contapadrao,cont1.cpfcnpjtitular,
       cont1.postoagencia,cont1.importacao_hash,cont1.id_layoutcustodiacheque,cont1.lastupdate,cont1.tenant
FROM   financasmigration.contas cont1
LEFT JOIN financas.contas cont2 ON cont1.codigo = cont2.codigo
WHERE cont2.conta is null;

--financas.rateiospadrao

INSERT INTO financas.rateiospadrao
            (nome,versao,rateiopadrao,grupoempresarial,lastupdate,tenant)
SELECT rat1.nome,rat1.versao,rat1.rateiopadrao,rat1.grupoempresarial,rat1.lastupdate,rat1.tenant
FROM   financasmigration.rateiospadrao rat1
LEFT JOIN financas.rateiospadrao rat2 ON rat1.nome = rat2.nome AND rat1.grupoempresarial = rat2.grupoempresarial
WHERE rat2.rateiopadrao is null;

--ns.formaspagamentos

INSERT INTO ns.formaspagamentos
            (formapagamento,codigo,descricao,tipo,padrao,uf,diasprevisaoreceber,
             tipodiasreceber,sinaldiasreceber,diasprevisaopagar,tipodiaspagar,
             sinaldiaspagar,grupoempresarial,bloqueada,lastupdate,tenant)
SELECT form1.formapagamento,form1.codigo,form1.descricao,form1.tipo,form1.padrao,form1.uf,form1.diasprevisaoreceber,
       form1.tipodiasreceber,form1.sinaldiasreceber,form1.diasprevisaopagar,form1.tipodiaspagar,
       form1.sinaldiaspagar,form1.grupoempresarial,form1.bloqueada,form1.lastupdate,form1.tenant
FROM   nsmigration.formaspagamentos form1
LEFT JOIN ns.formaspagamentos form2 ON form1.tipo = form2.tipo AND form1.codigo = form2.codigo
WHERE form2.formapagamento is null;

--servicos.templatesordensservicos

INSERT INTO servicos.templatesordensservicos(
            templateordemservico, codigo, descricao, template, tipo, lastupdate, 
            tenant)
SELECT temp1.templateordemservico, temp1.codigo, temp1.descricao, temp1.template, temp1.tipo, temp1.lastupdate, 
       temp1.tenant
FROM servicosmigration.templatesordensservicos temp1
LEFT JOIN servicos.templatesordensservicos temp2 ON temp1.tipo = temp2.tipo AND temp1.codigo = temp2.codigo
WHERE temp2.templateordemservico is null;

--ns.clapes

INSERT INTO ns.clapes(
            codigo, descricao, tipoclapes, id_grupo, id, lastupdate, tenant)
SELECT cla1.codigo, cla1.descricao, cla1.tipoclapes, cla1.id_grupo, cla1.id, cla1.lastupdate, cla1.tenant
FROM nsmigration.clapes cla1
LEFT JOIN ns.clapes cla2 ON cla1.codigo = cla2.codigo AND cla1.tipoclapes = cla2.tipoclapes
WHERE cla2.id is null;

--crm.parcelamentos

INSERT INTO crm.parcelamentos(
            codigo, nome, incluirissprimeiraparcela, intervaloexatoentrevencimentos, 
            quantidadeparcelas, percentualjuros, versao, parcelamento, lastupdate, 
            tenant)
SELECT par1.codigo, par1.nome, par1.incluirissprimeiraparcela, par1.intervaloexatoentrevencimentos, 
       par1.quantidadeparcelas, par1.percentualjuros, par1.versao, par1.parcelamento, par1.lastupdate, 
       par1.tenant
FROM crmmigration.parcelamentos par1
LEFT JOIN crm.parcelamentos par2 ON par1.codigo = par2.codigo
WHERE par2.parcelamento is null;

--ns.pessoas

UPDATE nsmigration.pessoas pes1 set id_formapagamento = for2.formapagamento
FROM nsmigration.formaspagamentos for1, ns.formaspagamentos for2 
where pes1.id_formapagamento = for1.formapagamento 
AND for1.tipo = for2.tipo 
AND for1.codigo = for2.codigo;

UPDATE nsmigration.pessoas pes1 set id_conta_receber = cont2.conta
FROM financasmigration.contas cont1, financas.contas cont2 
where pes1.id_conta_receber = cont1.conta 
AND cont1.codigo = cont2.codigo;

INSERT INTO ns.pessoas
            (pessoa,datacadastro,proximocontato,nome,nomefantasia,
             tp_identificacao,cnpj,
             chavecnpj,cpf,caepf,inscricaoestadual,inscestsubstituto,
             inscricaomunicipal,rntrc,identidade,suframa,nit,nire,observacao,
             email,site,codigopis,codigocofins,codigocsll,codigoirrf,conta,
             contrapartida,contadesconto,contajuros,classefinpersona,
             contacorrente,ccustopersona,contamulta,contaestoque,bloqueado,
             contribuinteicms,contribuinteipi,produtorrural,substitutomunicipal,
             tiposimples,qualificacao,icmssimp,regimereceita,aliquotarat,
             aliquotafap,aliquotaterceiros,percentualtaxaservicoscooperativa,
             percentualinsscooperativa,orgaoemissor,tipoicms,
             codigocontabilcliente,anotacao,datacliente,datafornecedor,
             datavendedor,leadativado,clienteativado,fornecedorativado,
             vendedorativado,transportadoraativado,tecnicoativado,
             pagamentounificado,tipovencimento,diavencimento,
             notaantecipadacobranca,emailcobranca,enviarnfeporemail,
             pontofidelidade,retempis,retemcofins,retemcsll,retemirrf,retemiss,
             tipolead,descricao,totalfuncionarios,receitaanual,datacriacao,
             codigocontabilfornecedor,banco,agencianumero,agencianome,
             contanumero,podeparticiparagendamento,codigocontabiltransportadora,
             datatransportadora,cobrancaaposservico,prorataantecipada,
             celulavenda,classificacaolead,midiaorigem,parcelamento,promocaolead
             ,representante,segmentoatuacao,statuslead,agencia,centrocusto,
             id_grupo,idclasspessoacliente,idclasspessoafornecedor,
             idclasspessoatransportadora,idclasspessoavendedor,classificado,id,
             captador,vendedor,usuariovendedor,criador,contatoativado,
             id_receitadiferenciada,id_despesadiferenciada,tpcontacompra,
             fichaativado,categoriatecnico_id,percentualfaturamentoservico,
             percentualfaturamentoencargo,percentualfaturamentoiss,
             percentualfaturamentoretencao,valormaxdesconto,id_conta,
             id_rateiopadrao,tributoativado,enviarboletoporemail,
             concessionariapublica,codigoconcessionaria,id_conta_receber,
             id_rateiopadrao_receber,id_layoutcobranca,id_cliente_fatura,
             diafaturamento,diasvencimentofatura,id_formapagamento,
             templateordemservico,nacionalidade,chavegold,id_faixadecredito,
             limite_de_credito,importacao_hash,
             enderecocobrancautilizarenderecoprincipal,
             enderecoentregautilizarenderecoprincipal,retem_inss,
             representantecomercialativado,representantetecnicoativado,
             representante_tecnico,representante_conv_old,template_rps,
             percentualtaxacobrancaterceirizacao,dataultimacompra,
             valorultimacompra,projeto,contratounificadonacobranca,
             usarvencimentounificado,diavencimentounificado,
             indicadorinscricaoestadual,comissao,json_elementos_controle,
             enviarnfseporemail,documentoestrangeiro,
             id_formapagamento_fornecedor,tipocontrolepagamento,
             situacaopagamento,tipoclientepagamento,
             justificativasituacaopagamento,justificativatipoclientepagamento,
             inscritapaa,retem_abaixo_minimo,id_fornecedorfactoring,
             funcionarioativado,contribuinteindividualativado,
             tomadorfolhaativado,classificacaofinanceirafrete,
             classificacaofinanceiraseguro,classificacaofinanceiraoutdesp,
             notafutura,datasituacaopagamento,datatipoclientepagamento,
             reguacobranca,restricaocobranca1,restricaocobranca2,
             restricaocobranca3,tipocliente_codigo,tipocliente_descricao,
             grupodeparticipante,--desabilitadopersona,
             lastupdate,tenant)
SELECT pes1.pessoa,pes1.datacadastro,pes1.proximocontato,pes1.nome,pes1.nomefantasia,pes1.tp_identificacao,
       pes1.cnpj,
       pes1.chavecnpj,pes1.cpf,pes1.caepf,pes1.inscricaoestadual,pes1.inscestsubstituto,
       pes1.inscricaomunicipal,pes1.rntrc,pes1.identidade,pes1.suframa,pes1.nit,pes1.nire,pes1.observacao,pes1.email,
       pes1.site,pes1.codigopis,pes1.codigocofins,pes1.codigocsll,pes1.codigoirrf,pes1.conta,pes1.contrapartida,
       pes1.contadesconto,pes1.contajuros,pes1.classefinpersona,pes1.contacorrente,pes1.ccustopersona,
       pes1.contamulta,pes1.contaestoque,pes1.bloqueado,pes1.contribuinteicms,pes1.contribuinteipi,
       pes1.produtorrural,pes1.substitutomunicipal,pes1.tiposimples,pes1.qualificacao,pes1.icmssimp,
       pes1.regimereceita,pes1.aliquotarat,pes1.aliquotafap,pes1.aliquotaterceiros,
       pes1.percentualtaxaservicoscooperativa,pes1.percentualinsscooperativa,pes1.orgaoemissor,
       pes1.tipoicms,pes1.codigocontabilcliente,pes1.anotacao,pes1.datacliente,pes1.datafornecedor,
       pes1.datavendedor,pes1.leadativado,pes1.clienteativado,pes1.fornecedorativado,pes1.vendedorativado
       ,pes1.transportadoraativado,pes1.tecnicoativado,pes1.pagamentounificado,pes1.tipovencimento,
       pes1.diavencimento,pes1.notaantecipadacobranca,pes1.emailcobranca,pes1.enviarnfeporemail,
       pes1.pontofidelidade,pes1.retempis,pes1.retemcofins,pes1.retemcsll,pes1.retemirrf,pes1.retemiss,
       pes1.tipolead,pes1.descricao,pes1.totalfuncionarios,pes1.receitaanual,pes1.datacriacao,
       pes1.codigocontabilfornecedor,pes1.banco,pes1.agencianumero,pes1.agencianome,pes1.contanumero,
       pes1.podeparticiparagendamento,pes1.codigocontabiltransportadora,pes1.datatransportadora
       ,pes1.cobrancaaposservico,pes1.prorataantecipada,pes1.celulavenda,pes1.classificacaolead,
       pes1.midiaorigem,pes1.parcelamento,pes1.promocaolead,pes1.representante,pes1.segmentoatuacao,
       pes1.statuslead,pes1.agencia,pes1.centrocusto,pes1.id_grupo,pes1.idclasspessoacliente,
       pes1.idclasspessoafornecedor,pes1.idclasspessoatransportadora,pes1.idclasspessoavendedor
       ,pes1.classificado,pes1.id,pes1.captador,pes1.vendedor,pes1.usuariovendedor,pes1.criador,pes1.contatoativado
       ,pes1.id_receitadiferenciada,pes1.id_despesadiferenciada,pes1.tpcontacompra,pes1.fichaativado
       ,pes1.categoriatecnico_id,pes1.percentualfaturamentoservico,
       pes1.percentualfaturamentoencargo,pes1.percentualfaturamentoiss,
       pes1.percentualfaturamentoretencao,pes1.valormaxdesconto,pes1.id_conta,pes1.id_rateiopadrao,
       pes1.tributoativado,pes1.enviarboletoporemail,pes1.concessionariapublica,
       pes1.codigoconcessionaria,pes1.id_conta_receber,pes1.id_rateiopadrao_receber,
       pes1.id_layoutcobranca,pes1.id_cliente_fatura,pes1.diafaturamento,pes1.diasvencimentofatura,
       pes1.id_formapagamento,pes1.templateordemservico,pes1.nacionalidade,pes1.chavegold,
       pes1.id_faixadecredito,pes1.limite_de_credito,pes1.importacao_hash,
       pes1.enderecocobrancautilizarenderecoprincipal,
       pes1.enderecoentregautilizarenderecoprincipal,pes1.retem_inss,
       pes1.representantecomercialativado,pes1.representantetecnicoativado,
       pes1.representante_tecnico,pes1.representante_conv_old,pes1.template_rps,
       pes1.percentualtaxacobrancaterceirizacao,pes1.dataultimacompra,pes1.valorultimacompra,
       pes1.projeto,pes1.contratounificadonacobranca,pes1.usarvencimentounificado,
       pes1.diavencimentounificado,pes1.indicadorinscricaoestadual,pes1.comissao,
       pes1.json_elementos_controle,pes1.enviarnfseporemail,pes1.documentoestrangeiro,
       pes1.id_formapagamento_fornecedor,pes1.tipocontrolepagamento,pes1.situacaopagamento,
       pes1.tipoclientepagamento,pes1.justificativasituacaopagamento,
       pes1.justificativatipoclientepagamento,pes1.inscritapaa,pes1.retem_abaixo_minimo,
       pes1.id_fornecedorfactoring,pes1.funcionarioativado,pes1.contribuinteindividualativado,
       pes1.tomadorfolhaativado,pes1.classificacaofinanceirafrete,
       pes1.classificacaofinanceiraseguro,pes1.classificacaofinanceiraoutdesp,pes1.notafutura,
       pes1.datasituacaopagamento,pes1.datatipoclientepagamento,pes1.reguacobranca,
       pes1.restricaocobranca1,pes1.restricaocobranca2,pes1.restricaocobranca3,
       pes1.tipocliente_codigo,pes1.tipocliente_descricao,pes1.grupodeparticipante,
       --desabilitadopersona,
       pes1.lastupdate,pes1.tenant
FROM   nsmigration.pessoas pes1
LEFT JOIN ns.pessoas pes2 ON pes1.cnpj = pes2.cnpj AND pes1.nome = pes2.nome
WHERE pes2.id is null;

--ns.classificadores

INSERT INTO ns.classificadores
            (etiqueta,modulo,ordem,tipo,tamanhomaximo,versao,classificador,
             subclassificacao,
             lastupdate,tenant)
SELECT cla1.etiqueta,cla1.modulo,cla1.ordem,cla1.tipo,cla1.tamanhomaximo,cla1.versao,cla1.classificador,
       cla1.subclassificacao,
       cla1.lastupdate,cla1.tenant
FROM   nsmigration.classificadores cla1
LEFT JOIN ns.classificadores cla2 ON cla1.modulo = cla2.modulo AND cla1.etiqueta = cla2.etiqueta
WHERE cla2.classificador is null;

--ns.contaspadroes

UPDATE nsmigration.contaspadroes cont1 set id_estabelecimento = est2.estabelecimento
FROM nsmigration.estabelecimentos est1, ns.estabelecimentos est2
WHERE est1.codigo = est2.codigo
AND est1.descricao = est2.descricao
AND est2.estabelecimento = cont1.id_estabelecimento;

UPDATE nsmigration.contaspadroes cont1 set id_conta = cont3.conta
FROM financasmigration.contas cont2, financas.contas cont3
WHERE cont2.codigo = cont3.codigo
AND cont2.nome = cont3.nome
AND cont2.conta = cont1.id_conta;

UPDATE nsmigration.contaspadroes cont1 set id_contamanutencao = cont3.conta
FROM financasmigration.contas cont2, financas.contas cont3
WHERE cont2.codigo = cont3.codigo
AND cont2.nome = cont3.nome
AND cont2.conta = cont1.id_contamanutencao;

INSERT INTO ns.contaspadroes
            (id,id_estabelecimento,id_conta,id_contamanutencao,lastupdate,tenant
)
SELECT cont1.id,cont1.id_estabelecimento,cont1.id_conta,cont1.id_contamanutencao,cont1.lastupdate,cont1.tenant
FROM   nsmigration.contaspadroes cont1
LEFT JOIN ns.contaspadroes cont2 ON cont1.id_estabelecimento = cont2.id_estabelecimento AND cont1.id_conta = cont2.id_conta
WHERE cont2.id is null;

--ns.contatosmaladireta

INSERT INTO ns.contatosmaladireta
            (listamaladireta,nomecontato,email,contatomaladireta,lastupdate,
             tenant)
SELECT cont1.listamaladireta,cont1.nomecontato,cont1.email,cont1.contatomaladireta,cont1.lastupdate,cont1.tenant
FROM   nsmigration.contatosmaladireta cont1
LEFT JOIN ns.contatosmaladireta cont2 ON cont1.listamaladireta = cont2.listamaladireta AND cont1.nomecontato = cont2.nomecontato
WHERE cont2.contatomaladireta is null;

--ns.cfop

INSERT INTO ns.cfop(
            tipo, cfop, grupo, descricao, retorno, statusicms, statusipi, 
            rapis, remas, tipomov, soposse, transporte, cnae, codserv, cpsrb, 
            observacao, discriminacaorps, retempis, retemcofins, retemcsll, 
            retemirrf, ibptaxa, id, aliquotaiss, cfopservico, reducaobase, 
            ibptaxamunicipal, ibptaxafederal, incluirdeducoes, afeta_customedio, 
            custo_nota_origem, id_cfop_lcp_116_2003, tipotributacaoservico, 
            codigobeneficiofiscal, sugerirtipotributacaoservico, lastupdate, 
            tenant)
SELECT cfop1.tipo, cfop1.cfop, cfop1.grupo, cfop1.descricao, cfop1.retorno, cfop1.statusicms, cfop1.statusipi, 
       cfop1.rapis, cfop1.remas, cfop1.tipomov, cfop1.soposse, cfop1.transporte, cfop1.cnae, cfop1.codserv, cfop1.cpsrb, 
       cfop1.observacao, cfop1.discriminacaorps, cfop1.retempis, cfop1.retemcofins, cfop1.retemcsll, 
       cfop1.retemirrf, cfop1.ibptaxa, cfop1.id, cfop1.aliquotaiss, cfop1.cfopservico, cfop1.reducaobase, 
       cfop1.ibptaxamunicipal, cfop1.ibptaxafederal, cfop1.incluirdeducoes, cfop1.afeta_customedio, 
       cfop1.custo_nota_origem, cfop1.id_cfop_lcp_116_2003, cfop1.tipotributacaoservico, 
       cfop1.codigobeneficiofiscal, cfop1.sugerirtipotributacaoservico, cfop1.lastupdate, 
       cfop1.tenant
FROM nsmigration.cfop cfop1
LEFT JOIN ns.cfop cfop2 ON cfop1.cfop = cfop2.cfop
WHERE cfop2.id is null;

--ns.naturezascontratos

INSERT INTO ns.naturezascontratos
            (id,id_owner,qtdmesesparareajuste,qtddiasparafim,qtddiasparainicio,
             percentualdesconto,percentualmulta,percentualjurosdiarios,
             tipocobranca,diavencimento,tipovencimento,unidadeintervalonatureza,
             quantidadeintervalonatureza,adicaomesesvencimento,unidadenatureza,
             dataproximoreajuste,considerardatainicio,parcelaatual,parcelafinal,
             parcelainicial,processaperiodoanterior,tipoemissao,
             qtddiasemissaotitulo,diaparafaturamento,usardataconclusaonegocio,
             indice,unidadeperiodoproposta,valorunidadeperiodoproposta,
             usarindicevariavel,lastupdate,tenant)
SELECT id,id_owner,qtdmesesparareajuste,qtddiasparafim,qtddiasparainicio,
       percentualdesconto,percentualmulta,percentualjurosdiarios,tipocobranca,
       diavencimento,tipovencimento,unidadeintervalonatureza,
       quantidadeintervalonatureza,adicaomesesvencimento,unidadenatureza,
       dataproximoreajuste,considerardatainicio,parcelaatual,parcelafinal,
       parcelainicial,processaperiodoanterior,tipoemissao,qtddiasemissaotitulo,
       diaparafaturamento,usardataconclusaonegocio,indice,unidadeperiodoproposta
       ,valorunidadeperiodoproposta,usarindicevariavel,lastupdate,tenant
FROM   nsmigration.naturezascontratos;

--ns.pessoasmunicipios

INSERT INTO ns.pessoasmunicipios
            (pessoamunicipio,ibge,pessoa,lastupdate,tenant)
SELECT pes1.pessoamunicipio,pes1.ibge,pes1.pessoa,pes1.lastupdate,pes1.tenant
FROM   nsmigration.pessoasmunicipios pes1
LEFT JOIN ns.pessoasmunicipios pes2 ON pes1.pessoa = pes2.pessoa AND pes1.ibge = pes2.ibge
WHERE pes2.pessoamunicipio is null;

--financas.contratos

UPDATE financasmigration.contratos con1 set id_formapagamento = for2.formapagamento
FROM nsmigration.formaspagamentos for1, ns.formaspagamentos for2 
where con1.id_formapagamento = for1.formapagamento 
AND for1.tipo = for2.tipo 
AND for1.codigo = for2.codigo;

INSERT INTO financas.contratos
            (contrato,codigo,descricao,tipocontrato,definicaocontratante,
             definicaobeneficiario,datainicial,administradorlegal,
             estabelecimento,participante,fiador,conta,bempatrimonial,
             qtddiasdesconto,qtddiasmulta,qtddiasjurosdiarios,percentualcomissao
             ,valorcomissao,percentualretencaoimposto,valorretencaoimposto,
             familia,processado,cancelado,datahoracancelamento,origem,
             emitirnotafiscal,tipocontabilizacao,formula_id,unidadenatureza,
             unidadeintervalonatureza,quantidadeintervalonatureza,tipovencimento
             ,diavencimento,adicaomesesvencimento,tipocobranca,qtddiasparainicio
             ,qtddiasparafim,qtdmesesparareajuste,percentualdesconto,
             percentualmulta,percentualjurosdiarios,indice,dataproximoreajuste,
             considerardatainicio,parcelainicial,parcelafinal,parcelaatual,
             participantecomissao,numero,processaperiodoanterior,
             debitoautomatico,perfilcontrato,classfinanceiracomissao,tipoemissao
             ,qtddiasemissaotitulo,id_tipo_outras_recdesp,gerartitulos,
             diaparafaturamento,id_formapagamento,diainicioreferencia,
             encerramentoprevisaofinanceira,datahoraencerramento,pessoamunicipio
             ,id_documento_vinculado,observacao,templateordemservico,
             grupofaturamento,datacontrolesistema,previsaofinanceirapersona,
             tipoordempagamentopersona,reajusteautomatico,id_proposta,
             anteciparvencimentodiautil,contratoemrenegociacao,layoutcobranca,
             detentor_id,titulosprovisorios,usarindicevariavel,pisretido,
             cofinsretido,csllretido,irretido,issretido,inssretido,
             outrasretencoes,descricaooutrasretencoes,
             id_tipo_outras_recdesplocacao,--contabilizar,contabilizar_baixa, 
             lastupdate,tenant)
SELECT cont1.contrato,cont1.codigo,cont1.descricao,cont1.tipocontrato,cont1.definicaocontratante,
       cont1.definicaobeneficiario,cont1.datainicial,cont1.administradorlegal,cont1.estabelecimento,
       cont1.participante,cont1.fiador,cont1.conta,cont1.bempatrimonial,cont1.qtddiasdesconto,cont1.qtddiasmulta,
       cont1.qtddiasjurosdiarios,cont1.percentualcomissao,cont1.valorcomissao,
       cont1.percentualretencaoimposto,cont1.valorretencaoimposto,cont1.familia,cont1.processado,
       cont1.cancelado,cont1.datahoracancelamento,cont1.origem,cont1.emitirnotafiscal,cont1.tipocontabilizacao
       ,cont1.formula_id,cont1.unidadenatureza,cont1.unidadeintervalonatureza,
       cont1.quantidadeintervalonatureza,cont1.tipovencimento,cont1.diavencimento,
       cont1.adicaomesesvencimento,cont1.tipocobranca,cont1.qtddiasparainicio,cont1.qtddiasparafim,
       cont1.qtdmesesparareajuste,cont1.percentualdesconto,cont1.percentualmulta,
       cont1.percentualjurosdiarios,cont1.indice,cont1.dataproximoreajuste,cont1.considerardatainicio,
       cont1.parcelainicial,cont1.parcelafinal,cont1.parcelaatual,cont1.participantecomissao,cont1.numero,
       cont1.processaperiodoanterior,cont1.debitoautomatico,cont1.perfilcontrato,
       cont1.classfinanceiracomissao,cont1.tipoemissao,cont1.qtddiasemissaotitulo,
       cont1.id_tipo_outras_recdesp,cont1.gerartitulos,cont1.diaparafaturamento,cont1.id_formapagamento,
       cont1.diainicioreferencia,cont1.encerramentoprevisaofinanceira,cont1.datahoraencerramento,
       cont1.pessoamunicipio,cont1.id_documento_vinculado,cont1.observacao,cont1.templateordemservico,
       cont1.grupofaturamento,cont1.datacontrolesistema,cont1.previsaofinanceirapersona,
       cont1.tipoordempagamentopersona,cont1.reajusteautomatico,cont1.id_proposta,
       cont1.anteciparvencimentodiautil,cont1.contratoemrenegociacao,cont1.layoutcobranca,
       cont1.detentor_id,cont1.titulosprovisorios,cont1.usarindicevariavel,cont1.pisretido,cont1.cofinsretido,
       cont1.csllretido,cont1.irretido,cont1.issretido,cont1.inssretido,cont1.outrasretencoes,
       cont1.descricaooutrasretencoes,cont1.id_tipo_outras_recdesplocacao,--cont1.contabilizar,cont1.contabilizar_baixa,
       cont1.lastupdate,cont1.tenant
FROM   financasmigration.contratos cont1
LEFT JOIN financas.contratos cont2 ON cont1.codigo = cont2.codigo AND cont1.participante = cont2.participante
WHERE cont2.contrato is null;

--financas.documentosrateados

INSERT INTO financas.documentosrateados
            (valor,versao,documentorateado,importacao_hash,lastupdate,tenant)
SELECT doc1.valor,doc1.versao,doc1.documentorateado,doc1.importacao_hash,doc1.lastupdate,doc1.tenant
FROM   financasmigration.documentosrateados doc1
LEFT JOIN financas.documentosrateados doc2 ON doc1.documentorateado = doc2.documentorateado
WHERE doc2.documentorateado is null;

--ns.obras

INSERT INTO ns.obras
            (obra,codigonfse,descricao,inicio,cei,fim,habite_se,inativa,
             tipologradouro,
             endereco,numero,complemento,bairro,municipio,cidade,estado,cep,art,
             tpobra,unidades,upcs,area,aliquotarat,aliquotafap,cnae,
             aliquotaterceiros,cpf,raizcnpj,ordemcnpj,tipoidentificacao,
             contribuicaopatronalsubstituida,cno,id_estabelecimento,id_orgao,
             id_pessoa,id_agente,id,sistemadecontroledeponto,
             indicatiocontratacaoaprendiz,processoaprendiz,
             aprendizcontratadoporintermedio,instituicaoeducativa,processofap,
             processorat,empreitada,tipoinscricaocontratante,
             inscricaocontratante,tipoinscricaoproprietario,
             inscricaoproprietario,lastupdate,tenant)
SELECT obr1.obra,obr1.codigonfse,obr1.descricao,obr1.inicio,obr1.cei,obr1.fim,obr1.habite_se,obr1.inativa,obr1.tipologradouro
       ,
       obr1.endereco,obr1.numero,obr1.complemento,obr1.bairro,obr1.municipio,obr1.cidade,obr1.estado,obr1.cep,obr1.art,obr1.tpobra
       ,obr1.unidades,obr1.upcs,obr1.area,obr1.aliquotarat,obr1.aliquotafap,obr1.cnae,obr1.aliquotaterceiros,obr1.cpf,
       obr1.raizcnpj,obr1.ordemcnpj,obr1.tipoidentificacao,obr1.contribuicaopatronalsubstituida,obr1.cno,
       obr1.id_estabelecimento,obr1.id_orgao,obr1.id_pessoa,obr1.id_agente,obr1.id,
       obr1.sistemadecontroledeponto,obr1.indicatiocontratacaoaprendiz,obr1.processoaprendiz,
       obr1.aprendizcontratadoporintermedio,obr1.instituicaoeducativa,obr1.processofap,
       obr1.processorat,obr1.empreitada,obr1.tipoinscricaocontratante,obr1.inscricaocontratante,
       obr1.tipoinscricaoproprietario,obr1.inscricaoproprietario,obr1.lastupdate,obr1.tenant
FROM   nsmigration.obras obr1
LEFT JOIN ns.obras obr2 ON obr1.codigonfse = obr2.codigonfse AND obr1.cei = obr2.cei
WHERE obr2.obra is null ;

--ns.series

UPDATE nsmigration.series ser1 SET estabelecimento = est2.estabelecimento
FROM nsmigration.estabelecimentos est1, ns.estabelecimentos est2
WHERE est1.estabelecimento = ser1.estabelecimento
AND est1.codigo = est2.codigo;

INSERT INTO ns.series
            (numero,situacao,criacao,inicio,fim,proximo,padrao,versao,
             estabelecimento,serie,
             tipodocumento,serie_fiscal,sub_serie,lastupdate,tenant)
SELECT ser1.numero,ser1.situacao,ser1.criacao,ser1.inicio,ser1.fim,ser1.proximo,ser1.padrao,ser1.versao,ser1.estabelecimento,
       ser1.serie,
       ser1.tipodocumento,ser1.serie_fiscal,ser1.sub_serie,ser1.lastupdate,ser1.tenant
FROM   nsmigration.series ser1
LEFT JOIN ns.series ser2 ON ser1.estabelecimento = ser2.estabelecimento AND ser1.numero = ser2.numero
WHERE ser2.serie is null;

--financas.processamentoscontratos

INSERT INTO financas.processamentoscontratos
            (processamentocontrato,dataprocessamento,tipocontrato,recorrencia,
             status,mes,ano,
             dia,semana,grupoempresarial,processamentocomissao,lastupdate,tenant
)
SELECT pro1.processamentocontrato,pro1.dataprocessamento,pro1.tipocontrato,pro1.recorrencia,pro1.status,
       pro1.mes,pro1.ano,
       pro1.dia,pro1.semana,pro1.grupoempresarial,pro1.processamentocomissao,pro1.lastupdate,pro1.tenant
FROM   financasmigration.processamentoscontratos pro1
LEFT JOIN financas.processamentoscontratos pro2 ON pro1.dataprocessamento = pro2.dataprocessamento AND pro1.grupoempresarial = pro2.grupoempresarial
WHERE pro2.processamentocontrato is null;

--estoque.locaisdeestoques

INSERT INTO estoque.locaisdeestoques(
            localdeestoque, estabelecimento, codigo, nome, tipo, tipologradouro, 
            logradouro, numero, complemento, cep, bairro, referencia, ibge, 
            cidade, uf, cnpj, enderecodiferente, lastupdate, tenant)
SELECT loc1.localdeestoque, loc1.estabelecimento, loc1.codigo, loc1.nome, loc1.tipo, loc1.tipologradouro, 
       loc1.logradouro, loc1.numero, loc1.complemento, loc1.cep, loc1.bairro, loc1.referencia, loc1.ibge, 
       loc1.cidade, loc1.uf, loc1.cnpj, loc1.enderecodiferente, loc1.lastupdate, loc1.tenant
FROM estoquemigration.locaisdeestoques loc1
LEFT JOIN estoque.locaisdeestoques loc2 ON loc1.estabelecimento = loc2.estabelecimento AND loc1.codigo = loc2.codigo
WHERE loc2.localdeestoque is null;

--ns.df_docfis

UPDATE nsmigration.df_docfis doc1 SET id_cfop = cfop2.id
FROM nsmigration.cfop cfop1, ns.cfop cfop2
WHERE cfop1.cfop = cfop2.cfop
AND cfop1.id = doc1.id_cfop;

INSERT INTO ns.df_docfis
            (id_ano,sinal,tipo,modelo,serie,subserie,numero,periodo,lancamento,
             emissao,cfop,
             cfopservico,tppessoa,atenumero,datainiserv,datafimserv,datasaida,
             datadeclaracao,datanotaconhec,horasaida,porcaixa,petroleo,
             notafatura,cfopdif,cfopserdif,cancelado,orgaopublico,somaiss,
             issoutromunic,retautomatica,retemiss,retemir,reteminss,retemcofins,
             retemcsll,retempis,retorno,porcontigencia,versao,situacao,
             situacaosped,tipocalctrib,tpligacao,grupotensao,crt,messerv,anoserv
             ,tiponfe,tpoperador,tpconsignatario,consumidor,tiporedespacho,remas
             ,rapis,tipofrete,tiporecolhimento,tipotransporte,volumes,
             tipodocexterior,parcelas,tipocontab,mesescredicms,anoaidf,anopexpam
             ,tipoimp,classe,tiporeceita,tipoconsumo,tiponavegacao,tipoveiculo,
             naturezafrete,tipotarifaar,chavene,chaveneini,chavene01,chavene02,
             chavene03,chavene04,chavenefim,codigoirrf,codigopis,codigocsll,
             codigocofins,numacdraw,campoligacao,terminal,codarea,rntrc,serierps
             ,rps,cnae,codmunic,codserv,municdest,codif,numerofrete,marca,
             tipovolume,placa,placa02,placa03,ufplaca,ufplaca02,ufplaca03,
             doccomexterior,parcelamento,renavam,codigodip,observacao,obsestoque
             ,selofiscal,aidf,numeropexpam,lacre,unidadecarga,frota,veiculo,
             viagem,otm,frete,seguro,basetransp,iss,deducaoiss,inss,ir,valoriss,
             baseiss,baseinss,valorinss,valorinssadicional,valorinssnaoretido,
             valorinsssubempreitada,baseir,valorir,basecofins,valorcofins,
             basecsll,valorcsll,basepis,valorpis,deducaobaseir,valordeducaoir,
             desconto,mercadorias,servicos,valor,valorliquido,diferenca,
             valordestacado,baseicms,icms,valoricms,icmsnaocred,isentasicms,
             outrasicms,reducaoicms,reducaoipi,baseipi,valoripi,ipi,isentasipi,
             outras,basesubst,substprop,substterc,substnaoret,icmsretido,pisimp,
             cofinsimp,basepisimp,basecofinsimp,valorpisimp,valorcofinsimp,
             consumo,kwh,fretemm,pesotx,freteliquido,valorsec_cat,despacho,
             pedagio,despportuarias,cargadescarga,taxaterrestre,advalorem,
             valorgris,outrosvalores,pesobruto,pesoliquido,cubagem,anotacoes,
             percbaseinss,percbaseir,id_itemntr,id,id_conhectransp,
             id_estabelecimento,id_orgao,id_operador,id_redespachador,
             id_emitente,id_pessoa,id_consignatario,id_coleta,id_entrega,
             id_remetente,id_destinatario,id_transportadora,id_motorista,id_obra
             ,id_grupodiferenciado,id_scp,tipodocumento,xml_docengine,
             xml_transmitido,tipopedido,formapagamento,autorizacaocartao,
             documentocartao,dataautorizacaocartao,valoravista,vezescartao,
             anotacao,id_proposta,id_grupoempresarial,id_promocao,
             id_posicaoworkflow,id_midiaorigem,id_conta,id_layoutbancario,
             id_informacaocartao,datanegocio,aprovadopor,datahoraaprovacao,
             acrescimofinanceiro,origem,id_objetoservico,id_docfis,id_cfop,
             discriminacaoservicos,statusrps,tiporps,tipotributacaoservicorps,
             regimeespecialtributacao,incentivocultural,ufprestacaoservico,
             cidadeprestacaoservico,id_estabelecimentocontraparte,
             descricaopagamento,datavalidade,contato,informacoespedido,
             id_oportunidade,id_parcelamento,id_docproposta,xml_cancelamento,
             motivo_cancelamento,data_cancelamento,datacriacao,horacriacao,
             referenciaexterna,tipoordemservico,origemordemservico,contrato,
             processamentocontrato,id_pedido,documento_operacao,
             documento_operacao_codigo,xml_titulos,ordemservico_id,caixa,
             pontodevenda,id_serie,dataentradasaida,tipoemitente,tiporeceptor,
             formadepagamento,tipooperacao,uffatogerador,modocompra,
             tipodeemissao,chave,observacao_movimentacao,tabeladepreco,
             id_localdeestoqueorigem,id_localdeestoquedestino,
             df_endereco_retirada,df_endereco_entrega,municipiofatogerador,
             xml_contingencia,datacontingencia,justificativacontingencia,
             debitoautomatico,contigencia_justificativa,contigencia_imprimiu,
             contigencia_datahora,numeroprotocolo,tipoambiente,
             lotecobrancaordemservico_id,documentorateado,
             requisicaoalmoxarifado_id,gerafinanceiro,id_conjunto_anexo,
             descricaoservicos,rps_original,tipo_retencao_iss,xml_rps,
             anotacoes_sistema,anotacoes_manuais,uf_embarque,local_embarque,
             local_despacho,origemdocumento,link_nfse,id_documento_vinculado,
             pessoamunicipio,id_usuario_cadastro,prazoentrega,notaimportacao,
             chavegold,wkf_data,wkf_estado,usuario_solicitacao_id,
             usuario_solicitacao_data,situacaogerencial,emailenviado,
             totalvalorfaturar,id_instancia,finalidadeemissao,id_operacao_nfs,
             analistacompra,infopiscompra,infocofinscompra,infoicmscompra,
             infoicmsstcompra,infoipicompra,status,vendedor,categoriadeproduto,
             uf_habilitacao,tipo_assinante,autenticacao_lote_digital,
             outras_retencoes,numero_titulo,vbcufdest,pfcpufdest,picmsufdest,
             picmsinter,picmsinterpart,vfcpufdest,vicmsufdest,vicmsufremet,
             dataprevisao_entradasaida,template_discriminacaorps,indiedest,
             sistema,tipo_insercao,reconstruirxml,indfinal,iddest,indpres,
             id_pedidoservico,iddestinoremessa,lotedigital,pretituloverificado,
             possuiadiantamento,tabeladefrete,observacao_dadosgerais,rascunho,
             recalcularimpostos,nota_antecipada,id_rateiopadrao,volumemanual,
             status_conferencia,outrosacrescimos,titulo_observacao,
             projeto_padrao_id,numeroexterno,naturezaoperacao,total_desconto,
             id_docfis_contrato,versao_dfe,troco,tipointegracao_pagamento,
             reinf_maodeobra,id_transacaofinanceira,id_contratofinanceiro,
             codigo_verificacao,rota,rota_liberado,id_opeinterna,id_moeda,
             id_cotacao,xmlexplodido,lastupdate,tenant)
SELECT id_ano,sinal,tipo,modelo,serie,subserie,numero,periodo,lancamento,emissao
       ,cfop,
       cfopservico,tppessoa,atenumero,datainiserv,datafimserv,datasaida,
       datadeclaracao,datanotaconhec,horasaida,porcaixa,petroleo,notafatura,
       cfopdif,cfopserdif,cancelado,orgaopublico,somaiss,issoutromunic,
       retautomatica,retemiss,retemir,reteminss,retemcofins,retemcsll,retempis,
       retorno,porcontigencia,versao,situacao,situacaosped,tipocalctrib,
       tpligacao,grupotensao,crt,messerv,anoserv,tiponfe,tpoperador,
       tpconsignatario,consumidor,tiporedespacho,remas,rapis,tipofrete,
       tiporecolhimento,tipotransporte,volumes,tipodocexterior,parcelas,
       tipocontab,mesescredicms,anoaidf,anopexpam,tipoimp,classe,tiporeceita,
       tipoconsumo,tiponavegacao,tipoveiculo,naturezafrete,tipotarifaar,chavene,
       chaveneini,chavene01,chavene02,chavene03,chavene04,chavenefim,codigoirrf,
       codigopis,codigocsll,codigocofins,numacdraw,campoligacao,terminal,codarea
       ,rntrc,serierps,rps,cnae,codmunic,codserv,municdest,codif,numerofrete,
       marca,tipovolume,placa,placa02,placa03,ufplaca,ufplaca02,ufplaca03,
       doccomexterior,parcelamento,renavam,codigodip,observacao,obsestoque,
       selofiscal,aidf,numeropexpam,lacre,unidadecarga,frota,veiculo,viagem,otm,
       frete,seguro,basetransp,iss,deducaoiss,inss,ir,valoriss,baseiss,baseinss,
       valorinss,valorinssadicional,valorinssnaoretido,valorinsssubempreitada,
       baseir,valorir,basecofins,valorcofins,basecsll,valorcsll,basepis,valorpis
       ,deducaobaseir,valordeducaoir,desconto,mercadorias,servicos,valor,
       valorliquido,diferenca,valordestacado,baseicms,icms,valoricms,icmsnaocred
       ,isentasicms,outrasicms,reducaoicms,reducaoipi,baseipi,valoripi,ipi,
       isentasipi,outras,basesubst,substprop,substterc,substnaoret,icmsretido,
       pisimp,cofinsimp,basepisimp,basecofinsimp,valorpisimp,valorcofinsimp,
       consumo,kwh,fretemm,pesotx,freteliquido,valorsec_cat,despacho,pedagio,
       despportuarias,cargadescarga,taxaterrestre,advalorem,valorgris,
       outrosvalores,pesobruto,pesoliquido,cubagem,anotacoes,percbaseinss,
       percbaseir,id_itemntr,id,id_conhectransp,id_estabelecimento,id_orgao,
       id_operador,id_redespachador,id_emitente,id_pessoa,id_consignatario,
       id_coleta,id_entrega,id_remetente,id_destinatario,id_transportadora,
       id_motorista,id_obra,id_grupodiferenciado,id_scp,tipodocumento,
       xml_docengine,xml_transmitido,tipopedido,formapagamento,autorizacaocartao
       ,documentocartao,dataautorizacaocartao,valoravista,vezescartao,anotacao,
       id_proposta,id_grupoempresarial,id_promocao,id_posicaoworkflow,
       id_midiaorigem,id_conta,id_layoutbancario,id_informacaocartao,datanegocio
       ,aprovadopor,datahoraaprovacao,acrescimofinanceiro,origem,
       id_objetoservico,id_docfis,id_cfop,discriminacaoservicos,statusrps,
       tiporps,tipotributacaoservicorps,regimeespecialtributacao,
       incentivocultural,ufprestacaoservico,cidadeprestacaoservico,
       id_estabelecimentocontraparte,descricaopagamento,datavalidade,contato,
       informacoespedido,id_oportunidade,id_parcelamento,id_docproposta,
       xml_cancelamento,motivo_cancelamento,data_cancelamento,datacriacao,
       horacriacao,referenciaexterna,tipoordemservico,origemordemservico,
       contrato,processamentocontrato,id_pedido,documento_operacao,
       documento_operacao_codigo,xml_titulos,ordemservico_id,caixa,pontodevenda,
       id_serie,dataentradasaida,tipoemitente,tiporeceptor,formadepagamento,
       tipooperacao,uffatogerador,modocompra,tipodeemissao,chave,
       observacao_movimentacao,tabeladepreco,id_localdeestoqueorigem,
       id_localdeestoquedestino,df_endereco_retirada,df_endereco_entrega,
       municipiofatogerador,xml_contingencia,datacontingencia,
       justificativacontingencia,debitoautomatico,contigencia_justificativa,
       contigencia_imprimiu,contigencia_datahora,numeroprotocolo,tipoambiente,
       lotecobrancaordemservico_id,documentorateado,requisicaoalmoxarifado_id,
       gerafinanceiro,id_conjunto_anexo,descricaoservicos,rps_original,
       tipo_retencao_iss,xml_rps,anotacoes_sistema,anotacoes_manuais,uf_embarque
       ,local_embarque,local_despacho,origemdocumento,link_nfse,
       id_documento_vinculado,pessoamunicipio,id_usuario_cadastro,prazoentrega,
       notaimportacao,chavegold,wkf_data,wkf_estado,usuario_solicitacao_id,
       usuario_solicitacao_data,situacaogerencial,emailenviado,totalvalorfaturar
       ,id_instancia,finalidadeemissao,id_operacao_nfs,analistacompra,
       infopiscompra,infocofinscompra,infoicmscompra,infoicmsstcompra,
       infoipicompra,status,vendedor,categoriadeproduto,uf_habilitacao,
       tipo_assinante,autenticacao_lote_digital,outras_retencoes,numero_titulo,
       vbcufdest,pfcpufdest,picmsufdest,picmsinter,picmsinterpart,vfcpufdest,
       vicmsufdest,vicmsufremet,dataprevisao_entradasaida,
       template_discriminacaorps,indiedest,sistema,tipo_insercao,reconstruirxml,
       indfinal,iddest,indpres,id_pedidoservico,iddestinoremessa,lotedigital,
       pretituloverificado,possuiadiantamento,tabeladefrete,
       observacao_dadosgerais,rascunho,recalcularimpostos,nota_antecipada,
       id_rateiopadrao,volumemanual,status_conferencia,outrosacrescimos,
       titulo_observacao,projeto_padrao_id,numeroexterno,naturezaoperacao,
       total_desconto,id_docfis_contrato,versao_dfe,troco,
       tipointegracao_pagamento,reinf_maodeobra,id_transacaofinanceira,
       id_contratofinanceiro,codigo_verificacao,rota,rota_liberado,id_opeinterna
       ,id_moeda,id_cotacao,xmlexplodido,lastupdate,tenant
FROM   nsmigration.df_docfis;

--ns.df_formapagamentos

INSERT INTO ns.df_formapagamentos
            (id,id_docfis,tipopag,valorpag,cnpjcredoracartao,bandeira,ordem,
             valortroco,
             lastupdate,tenant)
SELECT id,id_docfis,tipopag,valorpag,cnpjcredoracartao,bandeira,ordem,valortroco
       ,
       lastupdate,tenant
FROM   nsmigration.df_formapagamentos;

--ns.df_pagamentos

UPDATE nsmigration.df_pagamentos pag1 set id_formapagamento = for2.formapagamento
FROM nsmigration.formaspagamentos for1, ns.formaspagamentos for2 
where pag1.id_formapagamento = for1.formapagamento 
AND for1.tipo = for2.tipo 
AND for1.codigo = for2.codigo;

INSERT INTO ns.df_pagamentos
            (pagamento,id_formapagamento,id_docfis,id_conta,id_rateiopadrao,
             id_meioeletronico
             ,id_layoutcobranca,id_operadora,id_bandeira,id_parcelamento,
             nomeformadepagamento,nomemeioeletronico,nomebandeira,nomeoperadora,
             nomeconta,valor,numeroparcelas,datafatura,tipooperacao,
             autorizacaocartao,dataautorizacaocartao,documentocartao,irretido,
             pisretido,cofinsretido,csllretido,tipo,isdefault,issretido,
             inssretido,id_documentorateado,id_contratocartao,--tenant,
             percentual,cnpj_operadora,lastupdate)
SELECT pagamento,id_formapagamento,id_docfis,id_conta,id_rateiopadrao,
       id_meioeletronico
       ,id_layoutcobranca,id_operadora,id_bandeira,id_parcelamento,
       nomeformadepagamento,nomemeioeletronico,nomebandeira,nomeoperadora,
       nomeconta,valor,numeroparcelas,datafatura,tipooperacao,autorizacaocartao,
       dataautorizacaocartao,documentocartao,irretido,pisretido,cofinsretido,
       csllretido,tipo,isdefault,issretido,inssretido,id_documentorateado,
       id_contratocartao,--tenant,
       percentual,cnpj_operadora,lastupdate
FROM   nsmigration.df_pagamentos;

--ns.df_parcelas

INSERT INTO ns.df_parcelas
            (parcela,id_pagamento,numero,valor,vencimento,sequencial,conta,
             usarsaldocredito,
             valorcreditoautilizar,--tenant,
             competencia,basevencimentoparcela,
             percentual,intervalo,sinal,valoresalteradosmanualmente,lastupdate)
SELECT parcela,id_pagamento,numero,valor,vencimento,sequencial,conta,
       usarsaldocredito,valorcreditoautilizar,--tenant,
       competencia,basevencimentoparcela,percentual
       ,intervalo,sinal,valoresalteradosmanualmente,lastupdate
FROM   nsmigration.df_parcelas;

--financas.titulos

UPDATE financasmigration.titulos tit1 set id_formapagamento = for2.formapagamento
FROM nsmigration.formaspagamentos for1, ns.formaspagamentos for2 
where tit1.id_formapagamento = for1.formapagamento 
AND for1.tipo = for2.tipo 
AND for1.codigo = for2.codigo;

INSERT INTO financas.titulos
            (sinal,origem,numero,emissao,vencimento,situacao,parcela,
             totalparcelas,tppessoa,
             observacao,valor,valorbruto,irretido,cofinsretido,pisretido,
             csllretido,inssretido,issretido,desconto,juros,multa,taxabancaria,
             despesasbancarias,anotacao,id,id_docfis,id_estabelecimento,
             id_pessoa,id_darf,id_gnre,id_gps,id_icmsiss,id_outdoc,
             previsaovencimento,percentualdesconto,datalimitedesconto,
             percentualmulta,datainiciomulta,percentualjurosdiario,
             codigocontabil,parcelapedidovenda,nossonumero,linhadigitavel,
             codigobarras,conta,previsaoreceber,aliquotapis,aliquotacofins,
             aliquotacsll,aliquotair,layoutcobranca,documentorateado,rps,
             situacaotexto,origemtexto,emissaotexto,vencimentotexto,
             valorbrutotexto,emissaoanomes,emissaodia,vencimentoanomes,
             vencimentodia,formapagamento,vezescartao,valortarifacartao,
             autorizacaocartao,formapagamentotexto,documentocartao,
             numeroparcelacartao,aliquotaiss,pedidovenda,informacaocartao,
             valorparcelacartao,previsaopagar,numeronota,tipopagamento,
             layoutpagamento,dataagendamento,modelodocumentofiscal,
             seriedocumentofiscal,subseriedocumentofiscal,tipocontabilizacao,
             identificadorbancario,finalidadedocbradesco,tipodecontabradesco,
             id_rps,previsaovencimentotexto,id_pedido,id_fatura,id_servicobanco,
             id_formapagamentobanco,id_finalidadepagamentobanco,
             id_tipocontapagamentobanco,id_servicons,id_formapagamentons,
             id_finalidadepagamentons,id_tipocontapagamentons,id_bempatrimonial,
             codigodocedenteboleto,numerodocumentoboleto,especieboleto,
             aceiteboleto,dataprocessamentoboleto,usobancoboleto,carteiraboleto,
             datacompetenciatributos,codigodareceitatributos,
             numerodereferenciadarf,outrosacrescimos,percentualoutrosacrescimos,
             modoexibicaomulta,modoexibicaojuros,modoexibicaooutros,
             modoexibicaocodigobarras,valorreceitabrutaacumuladadarfsimples,
             percreceitabrutaacumuladadarfsimples,numerodeclaracaogare,
             numeroetiquetagare,numerodaparcelagare,codigorenavam,
             unidadefederacaoipva,codigomunicipioipva,placaveiculoipva,
             opcaodepagamentoipva,opcaoretiradacrlv,identificadorfgts,
             lacreconectividadesocial,numerodocumentodarj,dataprovisoria,
             valorprovisorio,adiantamento,saldoadiantamento,debitoautomatico,
             irretidonf,inssretidonf,id_contrato,modoexibicaodesconto,
             id_dfparcela,id_formapagamento,id_fatura_mercadoria,
             id_renegociacao_geradora,id_renegociacao_gerada,
             id_renegociacao_baixa,usadiscriminacao,wkf_estado,wkf_data,
             valorvariacaocambialativa,valorvariacaocambialpassiva,emprestimo,
             id_contaemprestimo,id_conjunto_anexo,numerodocumento,
             datacompetencia,usuarioresponsavel,chavepersona,tipoordempagamento,
             id_template,id_usuario_cadastro,datahoracriacao,
             dataautorizacaocartao,id_prestacaodeconta,titulocoberturaconta,
             coberturaconta,documentorateadocobertura,id_documento_associado,
             contafornecedor,previsto,pagamento,parcelapagamento,importacao_hash
             ,contabilizado,cfop_codigo,id_titulovinculo_previsao,
             id_previsao_vinculada,id_proposta,tipocredito,dataregularizacao,
             creditoidentificado,lancamentocontatc_id,enviadoremessacobranca,
             contabilizar,contabilizar_baixa,outrasretencoes,
             descricaooutrasretencoes,lastupdate,razaosocialfactoring,
             numerodocumentofactoring,razaosocialgps,numerodocumentogps,
             numeroexterno,id_renegociacaocontrato,estorno,id_titulo_estorno,
             tipoestorno,pisestornado,cofinsestornado,csllestornado,irestornado,
             inssestornado,issestornado,vencimentoalteradoregra,notafutura,
             id_transacaofinanceira,id_contratofinanceiro,id_baixaorigem_dimob,
             valoraserreembolsado,id_pessoa_reembolso,statusestorno,
             usamoedaestrangeira,moedaestrangeira,cotacao,
             valornamoedaestrangeira,dataultimopagamento,mesanocompetenciagps,
             outrasentidadesgps,saldosemjurosdescontos,
             saldoadiantamentosresgatados,id_titulo_origemcomissao,
             datacancelamento,id_tipo_despesa_receita)
             --,origemintegracao,origemintegracaodescricao,tenant)
SELECT sinal,origem,numero,emissao,vencimento,situacao,parcela,totalparcelas,
       tppessoa,
       observacao,valor,valorbruto,irretido,cofinsretido,pisretido,csllretido,
       inssretido,issretido,desconto,juros,multa,taxabancaria,despesasbancarias,
       anotacao,id,id_docfis,id_estabelecimento,id_pessoa,id_darf,id_gnre,id_gps
       ,id_icmsiss,id_outdoc,previsaovencimento,percentualdesconto,
       datalimitedesconto,percentualmulta,datainiciomulta,percentualjurosdiario,
       codigocontabil,parcelapedidovenda,nossonumero,linhadigitavel,codigobarras
       ,conta,previsaoreceber,aliquotapis,aliquotacofins,aliquotacsll,aliquotair
       ,layoutcobranca,documentorateado,rps,situacaotexto,origemtexto,
       emissaotexto,vencimentotexto,valorbrutotexto,emissaoanomes,emissaodia,
       vencimentoanomes,vencimentodia,formapagamento,vezescartao,
       valortarifacartao,autorizacaocartao,formapagamentotexto,documentocartao,
       numeroparcelacartao,aliquotaiss,pedidovenda,informacaocartao,
       valorparcelacartao,previsaopagar,numeronota,tipopagamento,layoutpagamento
       ,dataagendamento,modelodocumentofiscal,seriedocumentofiscal,
       subseriedocumentofiscal,tipocontabilizacao,identificadorbancario,
       finalidadedocbradesco,tipodecontabradesco,id_rps,previsaovencimentotexto,
       id_pedido,id_fatura,id_servicobanco,id_formapagamentobanco,
       id_finalidadepagamentobanco,id_tipocontapagamentobanco,id_servicons,
       id_formapagamentons,id_finalidadepagamentons,id_tipocontapagamentons,
       id_bempatrimonial,codigodocedenteboleto,numerodocumentoboleto,
       especieboleto,aceiteboleto,dataprocessamentoboleto,usobancoboleto,
       carteiraboleto,datacompetenciatributos,codigodareceitatributos,
       numerodereferenciadarf,outrosacrescimos,percentualoutrosacrescimos,
       modoexibicaomulta,modoexibicaojuros,modoexibicaooutros,
       modoexibicaocodigobarras,valorreceitabrutaacumuladadarfsimples,
       percreceitabrutaacumuladadarfsimples,numerodeclaracaogare,
       numeroetiquetagare,numerodaparcelagare,codigorenavam,unidadefederacaoipva
       ,codigomunicipioipva,placaveiculoipva,opcaodepagamentoipva,
       opcaoretiradacrlv,identificadorfgts,lacreconectividadesocial,
       numerodocumentodarj,dataprovisoria,valorprovisorio,adiantamento,
       saldoadiantamento,debitoautomatico,irretidonf,inssretidonf,id_contrato,
       modoexibicaodesconto,id_dfparcela,id_formapagamento,id_fatura_mercadoria,
       id_renegociacao_geradora,id_renegociacao_gerada,id_renegociacao_baixa,
       usadiscriminacao,wkf_estado,wkf_data,valorvariacaocambialativa,
       valorvariacaocambialpassiva,emprestimo,id_contaemprestimo,
       id_conjunto_anexo,numerodocumento,datacompetencia,usuarioresponsavel,
       chavepersona,tipoordempagamento,id_template,id_usuario_cadastro,
       datahoracriacao,dataautorizacaocartao,id_prestacaodeconta,
       titulocoberturaconta,coberturaconta,documentorateadocobertura,
       id_documento_associado,contafornecedor,previsto,pagamento,
       parcelapagamento,importacao_hash,contabilizado,cfop_codigo,
       id_titulovinculo_previsao,id_previsao_vinculada,id_proposta,tipocredito,
       dataregularizacao,creditoidentificado,lancamentocontatc_id,
       enviadoremessacobranca,contabilizar,contabilizar_baixa,outrasretencoes,
       descricaooutrasretencoes,lastupdate,razaosocialfactoring,
       numerodocumentofactoring,razaosocialgps,numerodocumentogps,numeroexterno,
       id_renegociacaocontrato,estorno,id_titulo_estorno,tipoestorno,
       pisestornado,cofinsestornado,csllestornado,irestornado,inssestornado,
       issestornado,vencimentoalteradoregra,notafutura,id_transacaofinanceira,
       id_contratofinanceiro,id_baixaorigem_dimob,valoraserreembolsado,
       id_pessoa_reembolso,statusestorno,usamoedaestrangeira,moedaestrangeira,
       cotacao,valornamoedaestrangeira,dataultimopagamento,mesanocompetenciagps,
       outrasentidadesgps,saldosemjurosdescontos,saldoadiantamentosresgatados,
       id_titulo_origemcomissao,datacancelamento,id_tipo_despesa_receita
       --origemintegracao,origemintegracaodescricao,tenant
FROM   financasmigration.titulos;

--servicos.tiposservicos

INSERT INTO servicos.tiposservicos(
            codigo, descricao, versao, tiposervico, id_grupoempresarial, 
            lastupdate, tenant)
SELECT codigo, descricao, versao, tiposervico, id_grupoempresarial, 
       lastupdate, tenant
FROM servicosmigration.tiposservicos;

--financas.classificacoesfinanceiras

INSERT INTO financas.classificacoesfinanceiras
            (codigo,descricao,codigocontabil,resumo,situacao,versao,natureza,
             classificacaofinanceira,paiid,grupoempresarial,resumoexplicativo,
             lastupdate,importacao_hash,iniciogrupo,apenasagrupador,padrao,
             transferencia,repasse_deducao,tenant,rendimentos)
SELECT codigo,descricao,codigocontabil,resumo,situacao,versao,natureza,
       classificacaofinanceira,paiid,grupoempresarial,resumoexplicativo,
       lastupdate,importacao_hash,iniciogrupo,apenasagrupador,padrao,
       transferencia,repasse_deducao,tenant,rendimentos
FROM   financasmigration.classificacoesfinanceiras;

--servicos.servicos

UPDATE servicosmigration.servicos ser1 SET cfop = cfop2.id
FROM nsmigration.cfop cfop1, ns.cfop cfop2
WHERE ser1.cfop = cfop1.id
AND cfop1.cfop = cfop2.cfop;

INSERT INTO servicos.servicos(
            servico, descricao, codigosped, atividade, lcp, codserv, nbs, 
            codigocontabil, contrapartida, centrocusto, cpsrb, incideirrf, 
            incideinss, tipoiss, regimepc, tributacaopc, bloqueado, tipoatividade, 
            sped_outro, sped_detalhe, tipo_esocial, valor, unidade, insspercentualincidencia, 
            descontocobranca, anotacao, incidecomissao, detalhes, aliquotainss, 
            classificacaofinanceira, id_grupo, cfop, id, vinculado, tiposervico, 
            tributacaoservico, geracobranca, tipoperiodocobranca, quantidadeperiodocobranca, 
            visivel, id_grupodeservico, sped_pc, valor_contrato, pode_alterar_valor_contrato_na_proposta, 
            empresacontroller, aquisicao, tipo_item_faturamento, unidade_medida, 
            lastupdate, tenant)
SELECT servico, descricao, codigosped, atividade, lcp, codserv, nbs, 
       codigocontabil, contrapartida, centrocusto, cpsrb, incideirrf, 
       incideinss, tipoiss, regimepc, tributacaopc, bloqueado, tipoatividade, 
       sped_outro, sped_detalhe, tipo_esocial, valor, unidade, insspercentualincidencia, 
       descontocobranca, anotacao, incidecomissao, detalhes, aliquotainss, 
       classificacaofinanceira, id_grupo, cfop, id, vinculado, tiposervico, 
       tributacaoservico, geracobranca, tipoperiodocobranca, quantidadeperiodocobranca, 
       visivel, id_grupodeservico, sped_pc, valor_contrato, pode_alterar_valor_contrato_na_proposta, 
       empresacontroller, aquisicao, tipo_item_faturamento, unidade_medida, 
       lastupdate, tenant
FROM servicosmigration.servicos;

--financas.motivocancelamentoitemcontrato

INSERT INTO financas.motivocancelamentoitemcontrato
            (id,codigo,descricao,lastupdate,tenant)
SELECT id,codigo,descricao,lastupdate,tenant
FROM   financasmigration.motivocancelamentoitemcontrato;

--financas.itenscontratos

INSERT INTO financas.itenscontratos
            (itemcontrato,contrato,servico,codigo,observacao,valor,rateio,
             processado,
             cancelado,datahoracancelamento,quantidade,objetoservicoitem,
             descontosnopedido,unidadenatureza,unidadeintervalonatureza,
             quantidadeintervalonatureza,tipovencimento,diavencimento,
             adicaomesesvencimento,qtddiasparainicio,qtddiasparafim,
             qtdmesesparareajuste,percentualdesconto,percentualmulta,
             percentualjurosdiarios,tipocobranca,ultimadataprocessamento,
             ultimadataprocessamentotemp,recorrente,indice,dataproximoreajuste,
             diaultimadataprocessamento,considerardatainicio,recorrenciapropria,
             parcelainicial,parcelafinal,parcelaatual,possuicomissao,
             retemimposto,tipovalor,objetoservico_id,processaperiodoanterior,
             dataproximaprevisao,dataproximaprevisaosugerida,tipoemissao,
             qtddiasemissaotitulo,usadiscriminacao,qtdtitulosagerar,
             qtdtitulosgerados,diaparafaturamento,id_item_faturamento,codigoitem
             ,grupofaturamento,reajusteautomatico,tiposuspensao,tipocomissao,
             itemcontratoorigem,transferido,datafaturamento,
             numerodiasparavencimento,previsaovencimento,situacaofaturamento,
             origemnaorecorrente,tipocancelamento,motivocancelamento,
             usarindicevariavel,evento,lastupdate,tenant)
SELECT itemcontrato,contrato,servico,codigo,observacao,valor,rateio,processado,
       cancelado,datahoracancelamento,quantidade,objetoservicoitem,
       descontosnopedido,unidadenatureza,unidadeintervalonatureza,
       quantidadeintervalonatureza,tipovencimento,diavencimento,
       adicaomesesvencimento,qtddiasparainicio,qtddiasparafim,
       qtdmesesparareajuste,percentualdesconto,percentualmulta,
       percentualjurosdiarios,tipocobranca,ultimadataprocessamento,
       ultimadataprocessamentotemp,recorrente,indice,dataproximoreajuste,
       diaultimadataprocessamento,considerardatainicio,recorrenciapropria,
       parcelainicial,parcelafinal,parcelaatual,possuicomissao,retemimposto,
       tipovalor,objetoservico_id,processaperiodoanterior,dataproximaprevisao,
       dataproximaprevisaosugerida,tipoemissao,qtddiasemissaotitulo,
       usadiscriminacao,qtdtitulosagerar,qtdtitulosgerados,diaparafaturamento,
       id_item_faturamento,codigoitem,grupofaturamento,reajusteautomatico,
       tiposuspensao,tipocomissao,itemcontratoorigem,transferido,datafaturamento
       ,numerodiasparavencimento,previsaovencimento,situacaofaturamento,
       origemnaorecorrente,tipocancelamento,motivocancelamento,
       usarindicevariavel,evento,lastupdate,tenant
FROM   financasmigration.itenscontratos;

--ns.df_servicos

INSERT INTO ns.df_servicos
            (id_ano,cfop,descricao,incideirrf,incideinss,tipo,rapis,remas,
             deducao,unitario,
             quantidade,valordesc,valor,vlrservicos15,vlrservicos20,
             vlrservicos25,valorinssadicional,valorinssnaoretido,ordem,id_docfis
             ,id_notadeducao,id,id_obra,id_servico,vencimento,inicioreferencia,
             fimreferencia,diasvencimento,titulo,itemcontrato,pessoa,contrato,
             processamentocontrato,tipocobranca,parcela,totalparcelas,
             objetoservico_id,tiposervico,base_iss,valor_iss,base_inss,
             valor_inss,base_irrf,valor_irrf,base_cofins,valor_cofins,base_pis,
             valor_pis,base_csll,valor_csll,retem_iss,retem_inss,retem_irrf,
             retem_cofins,retem_pis,retem_csll,emissao,valorcontabilpis,
             valorcontabilcofins,id_origem,desconto,datareajusteitemcontrato,
             valortotalocorrenciasitemcontrato,valordebitopis,valordebitocofins,
             aliquota_iss,aliquota_inss,aliquota_ir,aliquota_pis,aliquota_cofins
             ,aliquota_csll,percentual_incidencia_inss,reducao_base_iss,
             unitario_variavel,lastupdate,tenant)
SELECT id_ano,cfop,descricao,incideirrf,incideinss,tipo,rapis,remas,deducao,
       unitario,
       quantidade,valordesc,valor,vlrservicos15,vlrservicos20,vlrservicos25,
       valorinssadicional,valorinssnaoretido,ordem,id_docfis,id_notadeducao,id,
       id_obra,id_servico,vencimento,inicioreferencia,fimreferencia,
       diasvencimento,titulo,itemcontrato,pessoa,contrato,processamentocontrato,
       tipocobranca,parcela,totalparcelas,objetoservico_id,tiposervico,base_iss,
       valor_iss,base_inss,valor_inss,base_irrf,valor_irrf,base_cofins,
       valor_cofins,base_pis,valor_pis,base_csll,valor_csll,retem_iss,retem_inss
       ,retem_irrf,retem_cofins,retem_pis,retem_csll,emissao,valorcontabilpis,
       valorcontabilcofins,id_origem,desconto,datareajusteitemcontrato,
       valortotalocorrenciasitemcontrato,valordebitopis,valordebitocofins,
       aliquota_iss,aliquota_inss,aliquota_ir,aliquota_pis,aliquota_cofins,
       aliquota_csll,percentual_incidencia_inss,reducao_base_iss,
       unitario_variavel,lastupdate,tenant
FROM   nsmigration.df_servicos;

--ns.df_vendedores

INSERT INTO ns.df_vendedores
            (df_vendedor,id_docfis,vendedor,percentual,padrao,
             percentual_comissao,lastupdate,
             tenant)
SELECT df_vendedor,id_docfis,vendedor,percentual,padrao,percentual_comissao,
       lastupdate,
       tenant
FROM   nsmigration.df_vendedores;

--ns.empresasacessosusuarios

INSERT INTO ns.empresasacessosusuarios
            (empresa,empresaacessousuario,usuario,lastupdate,tenant)
SELECT empresa,empresaacessousuario,usuario,lastupdate,tenant
FROM   nsmigration.empresasacessosusuarios;

--ns.enderecos

INSERT INTO ns.enderecos
            (tipologradouro,logradouro,numero,complemento,cep,bairro,
             tipoendereco,ufexterior,
             enderecopadrao,uf,pais,ibge,cidade,referencia,versao,endereco,
             id_pessoa,lastupdate,tenant)
SELECT tipologradouro,logradouro,numero,complemento,cep,bairro,tipoendereco,
       ufexterior,
       enderecopadrao,uf,pais,ibge,cidade,referencia,versao,endereco,id_pessoa,
       lastupdate,tenant
FROM   nsmigration.enderecos;

--ns.cadastros

INSERT INTO ns.cadastros(
            tipo, codigo, cadastro, lastupdate, tenant)
SELECT cad1.tipo, cad1.codigo, cad1.cadastro, cad1.lastupdate, cad1.tenant
FROM nsmigration.cadastros cad1
LEFT JOIN ns.cadastros cad2 ON cad1.tipo = cad2.tipo AND cad1.codigo = cad2.codigo
WHERE cad2.cadastro is null;

--ns.empresascadastros

INSERT INTO ns.empresascadastros
            (cadastro,empresa,empresacadastro,lastupdate,tenant)
SELECT cadastro,empresa,empresacadastro,lastupdate,tenant
FROM   nsmigration.empresascadastros;

--ns.estabelecimentosacessosusuarios

INSERT INTO ns.estabelecimentosacessosusuarios
            (estabelecimentoacessousuario,estabelecimento,usuario,lastupdate,
             tenant)
SELECT estabelecimentoacessousuario,estabelecimento,usuario,lastupdate,tenant
FROM   nsmigration.estabelecimentosacessosusuarios;

--ns.estabelecimentoscadastros

INSERT INTO ns.estabelecimentoscadastros
            (cadastro,estabelecimento,estabelecimentocadastro,lastupdate,tenant)
SELECT cadastro,estabelecimento,estabelecimentocadastro,lastupdate,tenant
FROM   nsmigration.estabelecimentoscadastros;

--ns.estabelecimentoscfops
UPDATE nsmigration.estabelecimentoscfops est1 SET cfop = cfop2.id
FROM nsmigration.cfop cfop1, ns.cfop cfop2
WHERE cfop1.id = est1.cfop
AND cfop1.cfop = cfop2.cfop;

INSERT INTO ns.estabelecimentoscfops
            (versao,cfop,estabelecimento,estabelecimentocfop,lastupdate,tenant)
SELECT versao,cfop,estabelecimento,estabelecimentocfop,lastupdate,tenant
FROM   nsmigration.estabelecimentoscfops;

--ns.conjuntos

INSERT INTO ns.conjuntos
            (conjunto,descricao,cadastro,codigo,lastupdate,tenant)
SELECT conjunto,descricao,cadastro,codigo,lastupdate,tenant
FROM   nsmigration.conjuntos;

--ns.estabelecimentosconjuntos

INSERT INTO ns.estabelecimentosconjuntos
            (estabelecimentoconjunto,estabelecimento,conjunto,cadastro,permissao
             ,lastupdate,
             tenant)
SELECT estabelecimentoconjunto,estabelecimento,conjunto,cadastro,permissao,
       lastupdate,
       tenant
FROM   nsmigration.estabelecimentosconjuntos;

--ns.estabelecimentospessoas

INSERT INTO ns.estabelecimentospessoas
            (estabelecimentopessoa,estabelecimento,pessoa,lastupdate,tenant)
SELECT estabelecimentopessoa,estabelecimento,pessoa,lastupdate,tenant
FROM   nsmigration.estabelecimentospessoas;

--ns.faixasdecreditos

INSERT INTO ns.faixasdecreditos
            (faixadecredito,codigo,descricao,credito,id_grupoempresarial,
             lastupdate,tenant)
SELECT faixadecredito,codigo,descricao,credito,id_grupoempresarial,lastupdate,
       tenant
FROM   nsmigration.faixasdecreditos;

--ns.feriados

INSERT INTO ns.feriados
            (descricao,fixo,tipo,uf,municipio,data,versao,estabelecimento,
             feriado,pessoa,
             sindicato,obra,lotacao,tenant,lastupdate)
SELECT descricao,fixo,tipo,uf,municipio,data,versao,estabelecimento,feriado,
       pessoa,
       sindicato,obra,lotacao,tenant,lastupdate
FROM   nsmigration.feriados;

--ns.followups

INSERT INTO ns.followups
            (historico,data,versao,tempoatendimento,oportunidade,promocaolead,
             departamento,
             followup,participante,tipofollowup,usuario,atendimento,ordemservico
             ,proposta,atendimentonegociacao,pedidogerencial,responsavel,tipo,
             resumo,criadopelocliente,canal,lastupdate,tenant)
SELECT historico,data,versao,tempoatendimento,oportunidade,promocaolead,
       departamento,
       followup,participante,tipofollowup,usuario,atendimento,ordemservico,
       proposta,atendimentonegociacao,pedidogerencial,responsavel,tipo,resumo,
       criadopelocliente,canal,lastupdate,tenant
FROM   nsmigration.followups;

--ns.formaspagamentoscontas

INSERT INTO ns.formaspagamentoscontas
            (formapagamentoconta,formapagamento,conta,estabelecimento,lastupdate
             ,tenant)
SELECT formapagamentoconta,formapagamento,conta,estabelecimento,lastupdate,
       tenant
FROM   nsmigration.formaspagamentoscontas;

--ns.gestoresprojetos

INSERT INTO ns.gestoresprojetos
            (gestorprojeto,codigo,descricao,lastupdate,tenant)
SELECT gestorprojeto,codigo,descricao,lastupdate,tenant
FROM   nsmigration.gestoresprojetos;

--ns.gruposdeparticipantes

INSERT INTO ns.gruposdeparticipantes
            (grupodeparticipante,codigo,descricao,lastupdate,tenant)
SELECT grupodeparticipante,codigo,descricao,lastupdate,tenant
FROM   nsmigration.gruposdeparticipantes;

--ns.gruposdeusuarios

INSERT INTO ns.gruposdeusuarios
            (grupodeusuario,codigo,descricao,tenant,lastupdate)
SELECT grupodeusuario,codigo,descricao,tenant,lastupdate
FROM   nsmigration.gruposdeusuarios;

--ns.gruposdeusuariosacessos

INSERT INTO ns.gruposdeusuariosacessos
            (grupodeusuarioacesso,grupodeusuario,tiporegistro,registro,
             lastupdate,tenant)
SELECT grupodeusuarioacesso,grupodeusuario,tiporegistro,registro,lastupdate,
       tenant
FROM   nsmigration.gruposdeusuariosacessos;

--ns.gruposempresariaisacessosusuarios

INSERT INTO ns.gruposempresariaisacessosusuarios
            (grupoempresarialacessousuario,grupoempresarial,usuario,lastupdate,
             tenant)
SELECT grupoempresarialacessousuario,grupoempresarial,usuario,lastupdate,tenant
FROM   nsmigration.gruposempresariaisacessosusuarios;

--ns.gruposempresariaiscadastros

INSERT INTO ns.gruposempresariaiscadastros
            (cadastro,grupoempresarial,grupoempresarialcadastro,lastupdate,
             tenant)
SELECT cadastro,grupoempresarial,grupoempresarialcadastro,lastupdate,tenant
FROM   nsmigration.gruposempresariaiscadastros;

--ns.gruposusuarios

INSERT INTO ns.gruposusuarios
            (grupousuario,descricao,lastupdate,tenant)
SELECT grupousuario,descricao,lastupdate,tenant
FROM   nsmigration.gruposusuarios;

--ns.inscricoesestaduais

INSERT INTO ns.inscricoesestaduais
            (inscricaoestadualnumero,descricao,tipoinscricaoestadual,estado,
             versao,
             inscricaoestadual,id_pessoa,lastupdate,tenant)
SELECT inscricaoestadualnumero,descricao,tipoinscricaoestadual,estado,versao,
       inscricaoestadual,id_pessoa,lastupdate,tenant
FROM   nsmigration.inscricoesestaduais;

--ns.inscricoesestaduaisestabelecimentos

INSERT INTO ns.inscricoesestaduaisestabelecimentos
            (inscricaoestadual,descricao,tipoinscricaoestadual,estado,versao,
             estabelecimento,
             inscricaoestadualestabelecimento,lastupdate,tenant)
SELECT inscricaoestadual,descricao,tipoinscricaoestadual,estado,versao,
       estabelecimento,
       inscricaoestadualestabelecimento,lastupdate,tenant
FROM   nsmigration.inscricoesestaduaisestabelecimentos;

--ns.listasmaladireta

INSERT INTO ns.listasmaladireta
            (tipo,nomelista,descricao,empresa,lista,consultaeditorxml,
             layoutformulario,idweb,
             lastupdate,tenant)
SELECT tipo,nomelista,descricao,empresa,lista,consultaeditorxml,layoutformulario
       ,idweb,
       lastupdate,tenant
FROM   nsmigration.listasmaladireta;

--ns.numeros_docfis

INSERT INTO ns.numeros_docfis
            (id,id_estabelecimento,id_operacao,proximo_numero,lastupdate,tenant)
SELECT id,id_estabelecimento,id_operacao,proximo_numero,lastupdate,tenant
FROM   nsmigration.numeros_docfis;

--ns.perfisusuario

INSERT INTO ns.perfisusuario
            (nome,descricao,versao,perfilusuario,created_at,created_by,
             updated_at,updated_by,
             tenant,interno,configurar_acesso_restrito,lastupdate)
SELECT per1.nome,per1.descricao,per1.versao,per1.perfilusuario,per1.created_at,per1.created_by,per1.updated_at,
       per1.updated_by,
       per1.tenant,per1.interno,per1.configurar_acesso_restrito,per1.lastupdate
FROM   nsmigration.perfisusuario per1
LEFT JOIN ns.perfisusuario per2 ON per1.nome = per2.nome
WHERE per2.perfilusuario is null;

--ns.contatos

INSERT INTO ns.contatos
            (nome,nascimento,cargo,sexomasculino,observacao,email,primeironome,
             sobrenome,id,
             id_pessoa,principal,cpf,responsavellegal,titulo,lastupdate,tenant)
SELECT nome,nascimento,cargo,sexomasculino,observacao,email,primeironome,
       sobrenome,id,
       id_pessoa,principal,cpf,responsavellegal,titulo,lastupdate,tenant
FROM   nsmigration.contatos;

--ns.contadores

INSERT INTO ns.contadores
            (codigo,nome,logradouro,numero,complemento,bairro,cep,cidade,ibge,
             telefone,dddtel
             ,cpf,crc,estadocrc,tipocontador,dataregcrc,fax,dddfax,email,
             identidade,datavalidadedhpc,contador,lastupdate,tenant)
SELECT codigo,nome,logradouro,numero,complemento,bairro,cep,cidade,ibge,telefone
       ,dddtel
       ,cpf,crc,estadocrc,tipocontador,dataregcrc,fax,dddfax,email,identidade,
       datavalidadedhpc,contador,lastupdate,tenant
FROM   nsmigration.contadores;

--servicos.tiposprojetos

INSERT INTO servicos.tiposprojetos(
            tipoprojeto, grupoempresarial_id, codigo, descricao, lastupdate, 
            tenant)
SELECT tipoprojeto, grupoempresarial_id, codigo, descricao, lastupdate, 
       tenant
FROM servicosmigration.tiposprojetos;

--ns.departamentosusuarios

INSERT INTO ns.departamentosusuarios(
            sigla, nome, versao, departamentousuario, lastupdate, tenant)
SELECT dep1.sigla, dep1.nome, dep1.versao, dep1.departamentousuario, dep1.lastupdate, dep1.tenant
FROM nsmigration.departamentosusuarios dep1
LEFT JOIN ns.departamentosusuarios dep2 ON dep1.nome = dep2.nome
WHERE dep2.departamentousuario is null;

--ns.usuarios

INSERT INTO ns.usuarios
            (nome,situacao,email,login,senha,temresponsabilidadeatendimento,
             versao,
             moduloinicialpersona,moduloinicialscritta,moduloinicialcontabil,
             ultimoanocontabil,representante,departamento,ultimaempresapersona,
             ultimoestabelecimentocontabil,ultimaempresascritta,ultimogrupo,
             perfilusuario,usuario,grupodeusuario,
             ultimaentidadeempresarial_estoque,bloqueado_ate,telefone,
             representante_pessoa,vendedor,tenant,
             ultimoestabelecimentopersonaweb,lastupdate)
SELECT usu1.nome,usu1.situacao,usu1.email,usu1.login,usu1.senha,usu1.temresponsabilidadeatendimento,usu1.versao,
       usu1.moduloinicialpersona,usu1.moduloinicialscritta,usu1.moduloinicialcontabil,
       usu1.ultimoanocontabil,usu1.representante,usu1.departamento,usu1.ultimaempresapersona,
       usu1.ultimoestabelecimentocontabil,usu1.ultimaempresascritta,usu1.ultimogrupo,
       usu1.perfilusuario,usu1.usuario,usu1.grupodeusuario,usu1.ultimaentidadeempresarial_estoque,
       usu1.bloqueado_ate,usu1.telefone,usu1.representante_pessoa,usu1.vendedor,usu1.tenant,
       usu1.ultimoestabelecimentopersonaweb,usu1.lastupdate
FROM   nsmigration.usuarios usu1
LEFT JOIN ns.usuarios usu2 ON usu1.login = usu2.login
WHERE usu2.usuario is null;

--financas.projetos

INSERT INTO financas.projetos
            (projeto,codigo,nome,finalizado,datainicio,datafim,grupoempresarial,
             cliente_id,
             importacao_hash,estabelecimento_id,tipoprojeto_id,observacao,
             situacao,data_criacao,criado_por,projetopai,codigopai,valor,
             created_at,created_by,updated_at,updated_by,tenant,
             documentovinculado,usuario_responsavel,anotacao,producao_processo,
             producao_modelo_processo,origem,tipodocumentovinculado,
             sincronizaescopo,localdeuso,sincronizasolicitacao,pcp,dataentrega,
             tipoprojeto,tempoadquirido,responsavel,tempoprevisto,lastupdate)
SELECT projeto,codigo,nome,finalizado,datainicio,datafim,grupoempresarial,
       cliente_id,
       importacao_hash,estabelecimento_id,tipoprojeto_id,observacao,situacao,
       data_criacao,criado_por,projetopai,codigopai,valor,created_at,created_by,
       updated_at,updated_by,tenant,documentovinculado,usuario_responsavel,
       anotacao,producao_processo,producao_modelo_processo,origem,
       tipodocumentovinculado,sincronizaescopo,localdeuso,sincronizasolicitacao,
       pcp,dataentrega,tipoprojeto,tempoadquirido,responsavel,tempoprevisto,
       lastupdate
FROM   financasmigration.projetos;

--ns.rateios

INSERT INTO ns.rateios
            (rateio,classificacaofinanceira,centrocusto,projeto,bempatrimonial,
             tipo,valor,
             percentual,quantidade,observacao,ordem,id_documento_associado,
             tipo_documento_associado,id_linha_doc_associado,modo,conta,
             rateiopadrao,id_origem,id_parcela_doc_associado,lastupdate,tenant)
SELECT rateio,classificacaofinanceira,centrocusto,projeto,bempatrimonial,tipo,
       valor,
       percentual,quantidade,observacao,ordem,id_documento_associado,
       tipo_documento_associado,id_linha_doc_associado,modo,conta,rateiopadrao,
       id_origem,id_parcela_doc_associado,lastupdate,tenant
FROM   nsmigration.rateios;

--ns.relacoes

INSERT INTO ns.relacoes
            (relacao,nomeesquerda,nomedireita,lastupdate,tenant)
SELECT relacao,nomeesquerda,nomedireita,lastupdate,tenant
FROM   nsmigration.relacoes;

--ns.relacoespessoas

INSERT INTO ns.relacoespessoas
            (relacaopessoa,pessoaesquerda,pessoadireita,relacao,lastupdate,
             tenant)
SELECT relacaopessoa,pessoaesquerda,pessoadireita,relacao,lastupdate,tenant
FROM   nsmigration.relacoespessoas;

--ns.telefones

INSERT INTO ns.telefones
            (ddd,telefone,chavetel,descricao,ramal,tptelefone,ddi,
             ordemimportancia,contato,
             id_pessoa,id,principal,lastupdate,tenant)
SELECT ddd,telefone,chavetel,descricao,ramal,tptelefone,ddi,ordemimportancia,
       contato,
       id_pessoa,id,principal,lastupdate,tenant
FROM   nsmigration.telefones;

--ns.templates

INSERT INTO ns.templates
            (id,codigo,descricao,tipo,dados,lastupdate,tenant)
SELECT id,codigo,descricao,tipo,dados,lastupdate,tenant
FROM   nsmigration.templates;

--ns.templatesconsultasmaladireta

INSERT INTO ns.templatesconsultasmaladireta
            (templateconsultamaladireta,tipo,consultaeditorxml,lastupdate,tenant
)
SELECT tem1.templateconsultamaladireta,tem1.tipo,tem1.consultaeditorxml,tem1.lastupdate,tem1.tenant
FROM   nsmigration.templatesconsultasmaladireta tem1
LEFT JOIN ns.templatesconsultasmaladireta tem2 ON tem1.tipo = tem2.tipo AND tem1.consultaeditorxml = tem2.consultaeditorxml
WHERE tem2.templateconsultamaladireta is null;

--ns.templatesemails

INSERT INTO ns.templatesemails
            (templateemail,codigo,texto,tipo,estabelecimento_id,sistema,
             descricao,lastupdate,
             tenant)
SELECT templateemail,codigo,texto,tipo,estabelecimento_id,sistema,descricao,
       lastupdate,
       tenant
FROM   nsmigration.templatesemails;

--ns.usuariosfuncoes

INSERT INTO ns.usuariosfuncoes
            (usuariofuncao,usuario,funcao,created_at,created_by,updated_at,
             updated_by,
             lastupdate,tenant)
SELECT usuariofuncao,usuario,funcao,created_at,created_by,updated_at,updated_by,
       lastupdate,tenant
FROM   nsmigration.usuariosfuncoes;

--ns.usuariosgrupos

INSERT INTO ns.usuariosgrupos
            (grupousuario,usuario,lastupdate,tenant)
SELECT grupousuario,usuario,lastupdate,tenant
FROM   nsmigration.usuariosgrupos;

--ns.usuariossetores

INSERT INTO ns.usuariossetores
            (usuariosetor,usuario,setor,created_at,created_by,updated_at,
             updated_by,
             lastupdate,tenant)
SELECT usuariosetor,usuario,setor,created_at,created_by,updated_at,updated_by,
       lastupdate,tenant
FROM   nsmigration.usuariossetores; 

--financas.acoescontratos_ativos

INSERT INTO financas.acoescontratos_ativos
            (acaocontrato_ativo,acaocontrato,objetoservico,proximaocorrencia,
             lastupdate,
             tenant)
SELECT acaocontrato_ativo,acaocontrato,objetoservico,proximaocorrencia,
       lastupdate,
       tenant
FROM   financasmigration.acoescontratos_ativos;

--financas.adiantamentosbaixaspagar

INSERT INTO financas.adiantamentosbaixaspagar
            (valor,adiantamentobaixapagar,baixapagar,lancamentoconta,lastupdate,
             tenant)
SELECT valor,adiantamentobaixapagar,baixapagar,lancamentoconta,lastupdate,tenant
FROM   financasmigration.adiantamentosbaixaspagar;

--financas.adiantamentosbaixasreceber

INSERT INTO financas.adiantamentosbaixasreceber
            (valor,adiantamentobaixareceber,baixareceber,lancamentoconta,
             lastupdate,tenant)
SELECT valor,adiantamentobaixareceber,baixareceber,lancamentoconta,lastupdate,
       tenant
FROM   financasmigration.adiantamentosbaixasreceber;

--financas.adiantamentossaldos

INSERT INTO financas.adiantamentossaldos
            (tituloadiantamento,titulonotafiscal,valorresgatado,lastupdate,
             tenant)
SELECT tituloadiantamento,titulonotafiscal,valorresgatado,lastupdate,tenant
FROM   financasmigration.adiantamentossaldos;

--financas.administradoreslegais

INSERT INTO financas.administradoreslegais
            (administradorlegal,codigo,descricao,responsavelpj,responsavelpf,
             lastupdate,
             tenant)
SELECT administradorlegal,codigo,descricao,responsavelpj,responsavelpf,
       lastupdate,
       tenant
FROM   financasmigration.administradoreslegais;

--financas.agencias

INSERT INTO financas.agencias
            (codigo,nome,agencianumero,digitoverificador,logradouro,numero,
             complemento,bairro
             ,cidade,estado,cep,contato,telefone,dddtel,agencia,banco,lastupdate
             ,importacao_hash,tenant)
SELECT codigo,nome,agencianumero,digitoverificador,logradouro,numero,complemento
       ,bairro
       ,cidade,estado,cep,contato,telefone,dddtel,agencia,banco,lastupdate,
       importacao_hash,tenant
FROM   financasmigration.agencias;

--financas.ajustes

INSERT INTO financas.ajustes
            (ajuste,codigo,descricao,data,aplicacao,quantidade,sentido,motivo,
             grupoempresarial,lastupdate,valor,documentorateado,tenant)
SELECT ajuste,codigo,descricao,data,aplicacao,quantidade,sentido,motivo,
       grupoempresarial,lastupdate,valor,documentorateado,tenant
FROM   financasmigration.ajustes;

--financas.aplicacoes

INSERT INTO financas.aplicacoes
            (aplicacao,codigo,descricao,datainicio,datavencimento,investimento,
             quantidade,
             precounitario,valor,conta,compromissada,grupoempresarial,status,
             lancamentoconta,apenaspatrimonio,gestoraplicacao,lastupdate,
             descricaopatrimonio,documentorateado,compoesaldo,tenant)
SELECT aplicacao,codigo,descricao,datainicio,datavencimento,investimento,
       quantidade,
       precounitario,valor,conta,compromissada,grupoempresarial,status,
       lancamentoconta,apenaspatrimonio,gestoraplicacao,lastupdate,
       descricaopatrimonio,documentorateado,compoesaldo,tenant
FROM   financasmigration.aplicacoes;

--financas.arquivoremessacheques

INSERT INTO financas.arquivoremessacheques
            (arquivoremessacheque,nomearquivo,id_estabelecimento,
             codigo_estabelecimento,
             nome_estabelecimento,id_conta,codigo_conta,nome_conta,
             dataremessaenvio,id_layoutremessacheque,nome_layoutremessacheque,
             id_usuario,login,nome_usuario,datainicialfiltro,datafinalfiltro,
             flag_consideraremessa,periodofiltroremessa,lastupdate,tenant)
SELECT arquivoremessacheque,nomearquivo,id_estabelecimento,
       codigo_estabelecimento,
       nome_estabelecimento,id_conta,codigo_conta,nome_conta,dataremessaenvio,
       id_layoutremessacheque,nome_layoutremessacheque,id_usuario,login,
       nome_usuario,datainicialfiltro,datafinalfiltro,flag_consideraremessa,
       periodofiltroremessa,lastupdate,tenant
FROM   financasmigration.arquivoremessacheques;

--financas.arquivoremessachequesitens

INSERT INTO financas.arquivoremessachequesitens
            (arquivoremessachequesitem,arquivoremessacheque,cheque_id,
             identificadorcheque,
             datadeposito,dataprevista,datacaptura,valor,situacao,lastupdate,
             tenant)
SELECT arquivoremessachequesitem,arquivoremessacheque,cheque_id,
       identificadorcheque,
       datadeposito,dataprevista,datacaptura,valor,situacao,lastupdate,tenant
FROM   financasmigration.arquivoremessachequesitens;

--financas.arquivosretornosbancarios

INSERT INTO financas.arquivosretornosbancarios
            (arquivoretornobancario,nomearquivo,dataprocessamento,id_banco,
             codigo_banco,
             nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
             codigo_estabelecimento,nome_estabelecimento,id_layoutcobranca,
             nome_layoutcobranca,id_usuario,login,nome_usuario,lastupdate,tenant
)
SELECT arquivoretornobancario,nomearquivo,dataprocessamento,id_banco,
       codigo_banco,
       nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
       codigo_estabelecimento,nome_estabelecimento,id_layoutcobranca,
       nome_layoutcobranca,id_usuario,login,nome_usuario,lastupdate,tenant
FROM   financasmigration.arquivosretornosbancarios;

--financas.arquivosretornosbancariositens

INSERT INTO financas.arquivosretornosbancariositens
            (arquivoretornobancarioitem,arquivoretornobancario,id_titulo,
             numero_titulo,
             nossonumero,datapagamento,datacredito,codigo_ocorrencia,
             motivos_ocorrencia,valorprincipal,valorjurosmulta,
             valortarifabancaria,valorpago,valordiferenca,observacao,lastupdate,
             tenant)
SELECT arquivoretornobancarioitem,arquivoretornobancario,id_titulo,numero_titulo
       ,
       nossonumero,datapagamento,datacredito,codigo_ocorrencia,
       motivos_ocorrencia,valorprincipal,valorjurosmulta,valortarifabancaria,
       valorpago,valordiferenca,observacao,lastupdate,tenant
FROM   financasmigration.arquivosretornosbancariositens;

--financas.arquivosretornosborderos

INSERT INTO financas.arquivosretornosborderos
            (arquivoretornobordero,nomearquivo,dataprocessamento,id_banco,
             codigo_banco,
             nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
             codigo_estabelecimento,nome_estabelecimento,id_layoutpagamento,
             descricao_layoutpagamento,tipo_layoutpagamento,id_usuario,login,
             nome_usuario,lastupdate,tenant)
SELECT arquivoretornobordero,nomearquivo,dataprocessamento,id_banco,codigo_banco
       ,
       nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
       codigo_estabelecimento,nome_estabelecimento,id_layoutpagamento,
       descricao_layoutpagamento,tipo_layoutpagamento,id_usuario,login,
       nome_usuario,lastupdate,tenant
FROM   financasmigration.arquivosretornosborderos;

--financas.arquivosretornosborderositens

INSERT INTO financas.arquivosretornosborderositens
            (arquivoretornoborderoitem,arquivoretornobordero,id_titulo,
             numero_titulo,
             identificadorbancario,codigobarras,datapagamento,valorpago,
             nomefavorecido,codigo_ocorrencia,pagamentoefetuado,agendado,
             valorjurosmulta,valordescontos,nossonumero,numerodocumento,id_conta
             ,codigo_conta,nome_conta,lastupdate,numero_bordero,id_bordero,
             tenant)
SELECT arquivoretornoborderoitem,arquivoretornobordero,id_titulo,numero_titulo,
       identificadorbancario,codigobarras,datapagamento,valorpago,nomefavorecido
       ,codigo_ocorrencia,pagamentoefetuado,agendado,valorjurosmulta,
       valordescontos,nossonumero,numerodocumento,id_conta,codigo_conta,
       nome_conta,lastupdate,numero_bordero,id_bordero,tenant
FROM   financasmigration.arquivosretornosborderositens;

--financas.arquivosretornoscustodiascheques

INSERT INTO financas.arquivosretornoscustodiascheques
            (arquivoretornocustodiacheque,nomearquivo,dataprocessamento,id_banco
             ,codigo_banco
             ,nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
             codigo_estabelecimento,nome_estabelecimento,id_layoutcustodiacheque
             ,nome_layoutcustodiacheque,id_usuario,login,nome_usuario,lastupdate
             ,tenant)
SELECT arquivoretornocustodiacheque,nomearquivo,dataprocessamento,id_banco,
       codigo_banco
       ,nome_banco,id_conta,codigo_conta,nome_conta,id_estabelecimento,
       codigo_estabelecimento,nome_estabelecimento,id_layoutcustodiacheque,
       nome_layoutcustodiacheque,id_usuario,login,nome_usuario,lastupdate,tenant
FROM   financasmigration.arquivosretornoscustodiascheques;

--financas.arquivosretornoscustodiaschequesitens

INSERT INTO financas.arquivosretornoscustodiaschequesitens
            (arquivoretornocustodiachequeitem,id_arquivoretornocustodiacheque,
             id_chequecustodia,identificadorcheque,datacaptura,datadeposito,
             dataprevitacredito,valor,ocorrencias,observacao,lastupdate,tenant)
SELECT arquivoretornocustodiachequeitem,id_arquivoretornocustodiacheque,
       id_chequecustodia,identificadorcheque,datacaptura,datadeposito,
       dataprevitacredito,valor,ocorrencias,observacao,lastupdate,tenant
FROM   financasmigration.arquivosretornoscustodiaschequesitens;

--financas.atividadescontratos

INSERT INTO financas.atividadescontratos
            (atividadecontrato,contrato_id,descricao,intervalo,quantidade,
             cumulativo,expira,
             data_expiracao,taxa_visita,pedagio,preco_km,hora_normal,hora_extra,
             hora_noturna,hora_final_semana,taxa_visita_adicional,
             pedagio_adicional,preco_km_adicional,hora_normal_adicional,
             hora_extra_adicional,hora_noturna_adicional,
             hora_final_semana_adicional,endereco_id,tipo_manutencao,
             horas_franquia,distancia_cliente,valor_ajudante,
             valor_ajudante_adicional,lastupdate,tenant)
SELECT atividadecontrato,contrato_id,descricao,intervalo,quantidade,cumulativo,
       expira,
       data_expiracao,taxa_visita,pedagio,preco_km,hora_normal,hora_extra,
       hora_noturna,hora_final_semana,taxa_visita_adicional,pedagio_adicional,
       preco_km_adicional,hora_normal_adicional,hora_extra_adicional,
       hora_noturna_adicional,hora_final_semana_adicional,endereco_id,
       tipo_manutencao,horas_franquia,distancia_cliente,valor_ajudante,
       valor_ajudante_adicional,lastupdate,tenant
FROM   financasmigration.atividadescontratos;

--financas.avisoslancamentos

INSERT INTO financas.avisoslancamentos
            (avisolancamento,numero,data,valor,situacao,estabelecimento,conta,
             historico,
             numerolancamento,lastupdate,tenant)
SELECT avisolancamento,numero,data,valor,situacao,estabelecimento,conta,
       historico,
       numerolancamento,lastupdate,tenant
FROM   financasmigration.avisoslancamentos;

--financas.avisostitulos

INSERT INTO financas.avisostitulos
            (avisotitulo,numero,data,valor,situacao,estabelecimento,conta,
             historico,
             comretencao,lastupdate,numerolancamento,tipo,tenant)
SELECT avisotitulo,numero,data,valor,situacao,estabelecimento,conta,historico,
       comretencao,lastupdate,numerolancamento,tipo,tenant
FROM   financasmigration.avisostitulos;

--financas.lancamentoscontas

INSERT INTO financas.lancamentoscontas
            (data,documento,historico,sinal,valor,situacao,origem,emissao,
             versocheque,
             favorecido,codigocontabil,contabilizar,saldo,adiantamento,versao,
             conta,documentorateado,lancamentoconta,vinculado,participante,
             id_bempatrimonial,usadiscriminacao,prestacaodecontas,
             datacompetencia,id_formapagamento,id_titulo_reembolso,
             chavearquivoretornobancario,id_chequecustodia,created_at,created_by
             ,updated_at,updated_by,lastupdate,tenant)
SELECT data,documento,historico,sinal,valor,situacao,origem,emissao,versocheque,
       favorecido,codigocontabil,contabilizar,saldo,adiantamento,versao,conta,
       documentorateado,lancamentoconta,vinculado,participante,id_bempatrimonial
       ,usadiscriminacao,prestacaodecontas,datacompetencia,id_formapagamento,
       id_titulo_reembolso,chavearquivoretornobancario,id_chequecustodia,
       created_at,created_by,updated_at,updated_by,lastupdate,tenant
FROM   financasmigration.lancamentoscontas;

--financas.baixas

INSERT INTO financas.baixas
            (data,documento,favorecido,sinal,historico,valor,percdesconto,
             descontos,percjuros
             ,valorjuros,percmulta,valormulta,acrescimos,id,id_titulo,
             id_estabelecimento,lancamentoconta,datatexto,
             valorvariacaocambialativa,valorvariacaocambialpassiva,
             prestacaodecontas,lastupdate,retevepis,retevecofins,retevecsll,
             reteveirrf,reteveiss,importacao_hash,contabilizado,reteveinss,
             baixapermuta,valorpermuta,descricaopermuta,
             valorcobrancaterceirizacao,id_usuario_criacao,id_usuario_alteracao,
             id_conta_corrente_contabil,cotacao,tenant,origem)
SELECT data,documento,favorecido,sinal,historico,valor,percdesconto,descontos,
       percjuros
       ,valorjuros,percmulta,valormulta,acrescimos,id,id_titulo,
       id_estabelecimento,lancamentoconta,datatexto,valorvariacaocambialativa,
       valorvariacaocambialpassiva,prestacaodecontas,lastupdate,retevepis,
       retevecofins,retevecsll,reteveirrf,reteveiss,importacao_hash,
       contabilizado,reteveinss,baixapermuta,valorpermuta,descricaopermuta,
       valorcobrancaterceirizacao,id_usuario_criacao,id_usuario_alteracao,
       id_conta_corrente_contabil,cotacao,tenant,origem
FROM   financasmigration.baixas;

--financas.bandeirascartoes

INSERT INTO financas.bandeirascartoes
            (codigo,versao,bandeiracartao,lastupdate,codigo_nfe40,
             suporta_integracao,tenant)
SELECT ban1.codigo,ban1.versao,ban1.bandeiracartao,ban1.lastupdate,ban1.codigo_nfe40,ban1.suporta_integracao,
       ban1.tenant
FROM   financasmigration.bandeirascartoes ban1
LEFT JOIN financas.bandeirascartoes ban2 ON ban1.codigo = ban2.codigo
WHERE ban2.bandeiracartao is null;

--financas.beneficiario_planosaude

INSERT INTO financas.beneficiario_planosaude
            (id,beneficiario,planosaude,lastupdate,tenant)
SELECT id,beneficiario,planosaude,lastupdate,tenant
FROM   financasmigration.beneficiario_planosaude;

--financas.beneficiario_segurosaude

INSERT INTO financas.beneficiario_segurosaude
            (id,beneficiario,segurosaude,lastupdate,tenant)
SELECT id,beneficiario,segurosaude,lastupdate,tenant
FROM   financasmigration.beneficiario_segurosaude;

--financas.beneficiarios

INSERT INTO financas.beneficiarios
            (beneficiario,membrotitular,membrobeneficiario,tipo,numerocartao,
             dataapoliceseguro,senha,valorpremio,lastupdate,periodicidade,tenant
)
SELECT beneficiario,membrotitular,membrobeneficiario,tipo,numerocartao,
       dataapoliceseguro,senha,valorpremio,lastupdate,periodicidade,tenant
FROM   financasmigration.beneficiarios;

--financas.benspatrimoniais

INSERT INTO financas.benspatrimoniais
            (bempatrimonial,codigo,descricao,tipopatrimonio,proprietario,
             classificado,
             tipologradouro,logradouro,numero,complemento,cep,bairro,municipio,
             uf,familia,lastupdate,ordem,tenant)
SELECT bempatrimonial,codigo,descricao,tipopatrimonio,proprietario,classificado,
       tipologradouro,logradouro,numero,complemento,cep,bairro,municipio,uf,
       familia,lastupdate,ordem,tenant
FROM   financasmigration.benspatrimoniais;

--financas.benspatrimoniaisproprietarios

INSERT INTO financas.benspatrimoniaisproprietarios
            (id,bempatrimonial_id,proprietario_id,proprietario_participante_id,
             percentual,
             percentualcomissao,lastupdate,tenant)
SELECT id,bempatrimonial_id,proprietario_id,proprietario_participante_id,
       percentual,
       percentualcomissao,lastupdate,tenant
FROM   financasmigration.benspatrimoniaisproprietarios;

--financas.boletosbancarios

INSERT INTO financas.boletosbancarios
            (boletobancario,situacao,nomearquivo,datageracao,dataliquidacao,
             dataretiradacobranca,id_banco,codigo_banco,nome_banco,id_conta,
             codigo_conta,nome_conta,id_cliente,codigo_cliente,nome_cliente,
             id_titulo,numero_titulo,valor_titulo,nossonumero_titulo,
             vencimento_titulo,emissao_titulo,id_estabelecimento,
             codigo_estabelecimento,nome_estabelecimento,id_layoutcobranca,
             nome_layoutcobranca,lastupdate,codigo_erros,descricao_erros,tenant)
SELECT boletobancario,situacao,nomearquivo,datageracao,dataliquidacao,
       dataretiradacobranca,id_banco,codigo_banco,nome_banco,id_conta,
       codigo_conta,nome_conta,id_cliente,codigo_cliente,nome_cliente,id_titulo,
       numero_titulo,valor_titulo,nossonumero_titulo,vencimento_titulo,
       emissao_titulo,id_estabelecimento,codigo_estabelecimento,
       nome_estabelecimento,id_layoutcobranca,nome_layoutcobranca,lastupdate,
       codigo_erros,descricao_erros,tenant
FROM   financasmigration.boletosbancarios;

--financas.borderoseletronicos

INSERT INTO financas.borderoseletronicos
            (numero,situacao,emissao,valortotal,versao,borderoeletronico,conta,
             layoutpagamento,estabelecimento,tipo,ambienteteste,vencimento,
             comretencao,lastupdate,numerolancamento,observacao,tenant)
SELECT numero,situacao,emissao,valortotal,versao,borderoeletronico,conta,
       layoutpagamento,estabelecimento,tipo,ambienteteste,vencimento,comretencao
       ,lastupdate,numerolancamento,observacao,tenant
FROM   financasmigration.borderoseletronicos;

--financas.cenariosorcamentarios

INSERT INTO financas.cenariosorcamentarios
            (cenarioorcamentario,codigo,descricao,ano,tipocenario,
             tipovisualizacao,
             grupoempresarial,lastupdate,tipoperiodo,estabelecimento,projeto,
             tenant,centrocusto,data_inicio,data_fim)
SELECT cenarioorcamentario,codigo,descricao,ano,tipocenario,tipovisualizacao,
       grupoempresarial,lastupdate,tipoperiodo,estabelecimento,projeto,tenant,
       centrocusto,data_inicio,data_fim
FROM   financasmigration.cenariosorcamentarios;

--financas.centroscustos

INSERT INTO financas.centroscustos
            (codigo,descricao,codigocontabil,resumo,situacao,versao,centrocusto,
             paiid,
             grupoempresarial,natureza,resumoexplicativo,lastupdate,
             importacao_hash,usuario_responsavel,tenant)
SELECT codigo,descricao,codigocontabil,resumo,situacao,versao,centrocusto,paiid,
       grupoempresarial,natureza,resumoexplicativo,lastupdate,importacao_hash,
       usuario_responsavel,tenant
FROM   financasmigration.centroscustos;

--financas.centroscustoslancamentosexternos

INSERT INTO financas.centroscustoslancamentosexternos
            (centrocustolanctoexterno,codigo,descricao,locallanctoexterno,
             lastupdate,
             centrocusto,estabelecimento,bempatrimonial,pessoa,prioridade,tenant
)
SELECT centrocustolanctoexterno,codigo,descricao,locallanctoexterno,lastupdate,
       centrocusto,estabelecimento,bempatrimonial,pessoa,prioridade,tenant
FROM   financasmigration.centroscustoslancamentosexternos;

/*--financas.chequescustodias

INSERT INTO financas.chequescustodias
            (chequecustodia,formaentrada,identificacao,tipificacao,situacao,
             valor,datacaptura
             ,datadeposito,dataprevistacredito,tipobaixa,id_grupoempresarial,
             id_estabelecimento,id_conta,id_cliente,id_layoutcustodiacheque,
             id_documentorateado,identificadorbancario,lastupdate,tenant,
             --banconumero,contanumero,
             agencianumero,nomepessoacheque,observacao,
             statuscheque)
SELECT chequecustodia,formaentrada,identificacao,tipificacao,situacao,valor,
       datacaptura
       ,datadeposito,dataprevistacredito,tipobaixa,id_grupoempresarial,
       id_estabelecimento,id_conta,id_cliente,id_layoutcustodiacheque,
       id_documentorateado,identificadorbancario,lastupdate,tenant--,banconumero, contanumero,
       agencianumero,nomepessoacheque,observacao,statuscheque
FROM   financasmigration.chequescustodias;*/

--financas.chequespagamentos

INSERT INTO financas.chequespagamentos
            (id,numero,emissao,valortotal,situacao,id_estabelecimento,id_conta,
             historico,
             verso,favorecido,itemtalaocheque,comretencao,lastupdate,
             numerolancamento,tenant)
SELECT id,numero,emissao,valortotal,situacao,id_estabelecimento,id_conta,
       historico,
       verso,favorecido,itemtalaocheque,comretencao,lastupdate,numerolancamento,
       tenant
FROM   financasmigration.chequespagamentos;

--financas.classfin_classificacoeslancamentosexternos

INSERT INTO financas.classfin_classificacoeslancamentosexternos
            (classfin_classlanctoexterno,estabelecimento,
             classificacaolanctoexterno,
             centrocustolanctoexterno,classificacaofinanceira,lastupdate,tenant)
SELECT classfin_classlanctoexterno,estabelecimento,classificacaolanctoexterno,
       centrocustolanctoexterno,classificacaofinanceira,lastupdate,tenant
FROM   financasmigration.classfin_classificacoeslancamentosexternos;

--financas.classificacoeslancamentosexternos

INSERT INTO financas.classificacoeslancamentosexternos
            (classificacaolanctoexterno,codigo,descricao,classificacaopai,
             locallanctoexterno,
             lastupdate,complementodescricao,considerargrupo,agrupador,ativo,
             vale,adiantamento,tenant)
SELECT classificacaolanctoexterno,codigo,descricao,classificacaopai,
       locallanctoexterno,
       lastupdate,complementodescricao,considerargrupo,agrupador,ativo,vale,
       adiantamento,tenant
FROM   financasmigration.classificacoeslancamentosexternos;

--financas.clienteslotesfaturas

INSERT INTO financas.clienteslotesfaturas
            (id_lote,id_pessoa,lastupdate,tenant)
SELECT id_lote,id_pessoa,lastupdate,tenant
FROM   financasmigration.clienteslotesfaturas;

--financas.comecotas

INSERT INTO financas.comecotas
            (id_comecotas,id_ajuste,id_aplicacao,ano_mes,lastupdate,tenant)
SELECT id_comecotas,id_ajuste,id_aplicacao,ano_mes,lastupdate,tenant
FROM   financasmigration.comecotas;

--financas.composicoesgruposclassificadores

INSERT INTO financas.composicoesgruposclassificadores
            (composicaogrupoclassificador,grupoclassificador,
             classificacaofinanceira,
             lastupdate,tenant)
SELECT composicaogrupoclassificador,grupoclassificador,classificacaofinanceira,
       lastupdate,tenant
FROM   financasmigration.composicoesgruposclassificadores;

--financas.conciliacoesaplicacoes

INSERT INTO financas.conciliacoesaplicacoes
            (conciliacaoaplicacao,aplicacao,dataposicao,datahoraconciliacao,
             usuarioconciliacao,quantidade,valor,datahoracancelamento,
             usuariocancelamento,motivocancelamento,lastupdate,tenant)
SELECT conciliacaoaplicacao,aplicacao,dataposicao,datahoraconciliacao,
       usuarioconciliacao,quantidade,valor,datahoracancelamento,
       usuariocancelamento,motivocancelamento,lastupdate,tenant
FROM   financasmigration.conciliacoesaplicacoes;

--financas.conciliacoeslancamentos

INSERT INTO financas.conciliacoeslancamentos
            (dataefetuado,nomearquivo,versao,conciliacaolancamento,conta,usuario
             ,lastupdate,
             tenant)
SELECT dataefetuado,nomearquivo,versao,conciliacaolancamento,conta,usuario,
       lastupdate,
       tenant
FROM   financasmigration.conciliacoeslancamentos;

--financas.configuracoesbancarias

INSERT INTO financas.configuracoesbancarias
            (nome,valor,versao,configuracaobancaria,layoutcobranca,
             layoutpagamento,
             layoutchequecustodia,lastupdate,tenant)
SELECT nome,valor,versao,configuracaobancaria,layoutcobranca,layoutpagamento,
       layoutchequecustodia,lastupdate,tenant
FROM   financasmigration.configuracoesbancarias;

--financas.configuracoescontasinvestimentos

INSERT INTO financas.configuracoescontasinvestimentos
            (configuracaocontainvestimento,containvestimento,contafinanceira,
             grupoempresarial
             ,lastupdate,tenant)
SELECT configuracaocontainvestimento,containvestimento,contafinanceira,
       grupoempresarial
       ,lastupdate,tenant
FROM   financasmigration.configuracoescontasinvestimentos;

--financas.configuracoesfluxocaixa

INSERT INTO financas.configuracoesfluxocaixa
            (configuracaofluxocaixa,tempominimoprocessamento,
             datahoraultimoprocessamento,
             cor_estabelecimento,cor_recebimento,cor_pagamento,cor_saldoatual,
             cor_saldoanterior,cor_saldofinal,cor_bempatrimonial,linhatotais,
             idioma,altera_entradasaida,cor_transferenciaentrada,
             cor_transferenciasaida,grupoempresarial,classfinanpis,
             diavencimentopis,datacontrolepis,classfinancofins,
             diavencimentocofins,datacontrolecofins,classfinancsll,
             diavencimentocsll,datacontrolecsll,classfinanirrf,diavencimentoirrf
             ,datacontroleirrf,classfinaniss,diavencimentoiss,datacontroleiss,
             classfinaninss,diavencimentinss,datacontroleinss,
             cor_repassededucoesentrada,cor_repassededucoessaida,
             cor_saldorepassededucoes,cor_rendimentos,agruparnatureza,
             considerarfiltrossaldoanterior,lastupdate,tenant)
SELECT configuracaofluxocaixa,tempominimoprocessamento,
       datahoraultimoprocessamento,
       cor_estabelecimento,cor_recebimento,cor_pagamento,cor_saldoatual,
       cor_saldoanterior,cor_saldofinal,cor_bempatrimonial,linhatotais,idioma,
       altera_entradasaida,cor_transferenciaentrada,cor_transferenciasaida,
       grupoempresarial,classfinanpis,diavencimentopis,datacontrolepis,
       classfinancofins,diavencimentocofins,datacontrolecofins,classfinancsll,
       diavencimentocsll,datacontrolecsll,classfinanirrf,diavencimentoirrf,
       datacontroleirrf,classfinaniss,diavencimentoiss,datacontroleiss,
       classfinaninss,diavencimentinss,datacontroleinss,
       cor_repassededucoesentrada,cor_repassededucoessaida,
       cor_saldorepassededucoes,cor_rendimentos,agruparnatureza,
       considerarfiltrossaldoanterior,lastupdate,tenant
FROM   financasmigration.configuracoesfluxocaixa;

--financas.configuracoesrateiosinvestimentos

INSERT INTO financas.configuracoesrateiosinvestimentos
            (configuracaorateioinvestimento,estabelecimento,tipooperacao,
             classificacaofinanceira,descricao,lastupdate,banco,aplicacao,
             classfin_naocompoesaldo,tenant)
SELECT configuracaorateioinvestimento,estabelecimento,tipooperacao,
       classificacaofinanceira,descricao,lastupdate,banco,aplicacao,
       classfin_naocompoesaldo,tenant
FROM   financasmigration.configuracoesrateiosinvestimentos;

--financas.configuracoesterceirizacao

INSERT INTO financas.configuracoesterceirizacao
            (id,percentualtaxacobranca,limitequitacao,id_fornecedor,
             id_grupoempresarial,
             id_conta,lastupdate,tenant)
SELECT id,percentualtaxacobranca,limitequitacao,id_fornecedor,
       id_grupoempresarial,
       id_conta,lastupdate,tenant
FROM   financasmigration.configuracoesterceirizacao;

--financas.contasfornecedores

INSERT INTO financas.contasfornecedores
            (contafornecedor,banco,agencianumero,agenciadv,agencianome,
             contanumero,contadv,
             tipoconta,id_fornecedor,padrao,excluida,codigo,descricao,
             cnpjcpftitular,nometitular,lastupdate,tenant)
SELECT contafornecedor,banco,agencianumero,agenciadv,agencianome,contanumero,
       contadv,
       tipoconta,id_fornecedor,padrao,excluida,codigo,descricao,cnpjcpftitular,
       nometitular,lastupdate,tenant
FROM   financasmigration.contasfornecedores;

--financas.contasperfisusuario

INSERT INTO financas.contasperfisusuario
            (contaperfisusuario,conta,perfilusuario,permitido,lastupdate,tenant)
SELECT contaperfisusuario,conta,perfilusuario,permitido,lastupdate,tenant
FROM   financasmigration.contasperfisusuario;

--financas.contratoscartoes

INSERT INTO financas.contratoscartoes
            (tipooperacao,diaspagamento,versao,codigocontabil,bandeiracartao,
             contratocartao,
             meioeletronicocartao,operadoracartao,estabelecimento,
             grupoempresarial,codigo,descricao,cnpj,lastupdate,tenant)
SELECT tipooperacao,diaspagamento,versao,codigocontabil,bandeiracartao,
       contratocartao,
       meioeletronicocartao,operadoracartao,estabelecimento,grupoempresarial,
       codigo,descricao,cnpj,lastupdate,tenant
FROM   financasmigration.contratoscartoes;

--financas.contratosvendedores

INSERT INTO financas.contratosvendedores
            (contratovendedor,participante,contrato,comissao,participacao,
             lastupdate,tenant)
SELECT contratovendedor,participante,contrato,comissao,participacao,lastupdate,
       tenant
FROM   financasmigration.contratosvendedores;

--financas.cotacoesinvestimentos

INSERT INTO financas.cotacoesinvestimentos
            (cotacaoinvestimento,data,valor,investimento,grupocotacao,aplicacao,
             lastupdate,
             tenant)
SELECT cotacaoinvestimento,data,valor,investimento,grupocotacao,aplicacao,
       lastupdate,
       tenant
FROM   financasmigration.cotacoesinvestimentos;

--financas.dadosanaliticosfluxocaixa

INSERT INTO financas.dadosanaliticosfluxocaixa
            (dadoanaliticofluxocaixa,estabelecimento,classificacaofinanceira,
             conta,
             bempatrimonial,titulo,lancamentoconta,data,dia,mes,ano,semana,
             valorprevisto_recebimento,valorprevisto_pagamento,
             valorrealizado_recebimento,valorrealizado_pagamento,
             valorconciliado_recebimento,valorconciliado_pagamento,centrocusto,
             projeto,valor_baixa,documentoajusterateio,contratonaorecorrente,
             itemcontratonaorecorrente,datacompetencia,diacompetencia,
             mescompetencia,anocompetencia,semanacompetencia,lastupdate,tenant)
SELECT dadoanaliticofluxocaixa,estabelecimento,classificacaofinanceira,conta,
       bempatrimonial,titulo,lancamentoconta,data,dia,mes,ano,semana,
       valorprevisto_recebimento,valorprevisto_pagamento,
       valorrealizado_recebimento,valorrealizado_pagamento,
       valorconciliado_recebimento,valorconciliado_pagamento,centrocusto,projeto
       ,valor_baixa,documentoajusterateio,contratonaorecorrente,
       itemcontratonaorecorrente,datacompetencia,diacompetencia,mescompetencia,
       anocompetencia,semanacompetencia,lastupdate,tenant
FROM   financasmigration.dadosanaliticosfluxocaixa;

--financas.descontosduplicatas

INSERT INTO financas.descontosduplicatas
            (data,descontoduplicata,contratodesconto,valordescontado,
             valorcredito,valorjuros,
             valortarifacontratacao,valortarifatitulos,valoriof,
             id_lancamentoconta,lastupdate,tenant)
SELECT data,descontoduplicata,contratodesconto,valordescontado,valorcredito,
       valorjuros,
       valortarifacontratacao,valortarifatitulos,valoriof,id_lancamentoconta,
       lastupdate,tenant
FROM   financasmigration.descontosduplicatas;

--financas.descontosduplicatasitens

INSERT INTO financas.descontosduplicatasitens
            (descontoduplicataitem,status,id_tituloreceber,id_descontoduplicata,
             id_lancamentoestorno,dataestorno,lastupdate,tenant)
SELECT descontoduplicataitem,status,id_tituloreceber,id_descontoduplicata,
       id_lancamentoestorno,dataestorno,lastupdate,tenant
FROM   financasmigration.descontosduplicatasitens;

--financas.descontostitulosreceber

INSERT INTO financas.descontostitulosreceber
            (data,valor,tipo,versao,descontotituloreceber,lancamentoconta,
             tituloreceber,
             lastupdate,tenant)
SELECT data,valor,tipo,versao,descontotituloreceber,lancamentoconta,
       tituloreceber,
       lastupdate,tenant
FROM   financasmigration.descontostitulosreceber;

--financas.despesasmedicas

INSERT INTO financas.despesasmedicas
            (despesamedica,documento,datadespesa,valor,membrofamilia,prestador,
             crmprestador,
             situacao,tipodespesa,origem,lastupdate,tenant)
SELECT despesamedica,documento,datadespesa,valor,membrofamilia,prestador,
       crmprestador,
       situacao,tipodespesa,origem,lastupdate,tenant
FROM   financasmigration.despesasmedicas;

--financas.documentosajustesrateios

INSERT INTO financas.documentosajustesrateios
            (documentoajusterateio,codigo,descricao,data,datacompetencia,
             datacriacao,
             observacao,origem,numerodocumentoorigem,id_requisaoalmoxerifado,
             id_estabelecimento,id_usuario_criador,id_documentorateado,
             devolucaoalmoxarifado,lastupdate,tenant)
SELECT documentoajusterateio,codigo,descricao,data,datacompetencia,datacriacao,
       observacao,origem,numerodocumentoorigem,id_requisaoalmoxerifado,
       id_estabelecimento,id_usuario_criador,id_documentorateado,
       devolucaoalmoxarifado,lastupdate,tenant
FROM   financasmigration.documentosajustesrateios;

--financas.faixasimpostoderenda

INSERT INTO financas.faixasimpostoderenda
            (id,valorinicial,valorfinal,percentual,valordeducao,lastupdate,
             tenant)
SELECT id,valorinicial,valorfinal,percentual,valordeducao,lastupdate,tenant
FROM   financasmigration.faixasimpostoderenda;

--financas.faixastarifascartoes

INSERT INTO financas.faixastarifascartoes
            (limiteparcelamento,percentualtarifa,versao,contratocartao,
             faixatarifacartao,
             lastupdate,tenant)
SELECT limiteparcelamento,percentualtarifa,versao,contratocartao,
       faixatarifacartao,
       lastupdate,tenant
FROM   financasmigration.faixastarifascartoes;

--financas.faturas

INSERT INTO financas.faturas
            (id,estabelecimento,cliente,emissao,numero,usuario,processado,
             id_lote,desconto,
             percentualdesconto,modoexibicaodesconto,lastupdate,tenant)
SELECT id,estabelecimento,cliente,emissao,numero,usuario,processado,id_lote,
       desconto,
       percentualdesconto,modoexibicaodesconto,lastupdate,tenant
FROM   financasmigration.faturas;

--financas.filaprocessamentofluxocaixa

INSERT INTO financas.filaprocessamentofluxocaixa
            (dataprocessamento,lastupdate,tenant)
SELECT dataprocessamento,lastupdate,tenant
FROM   financasmigration.filaprocessamentofluxocaixa;

--financas.finalidadespagamentosbancos

UPDATE financasmigration.finalidadespagamentosbancos fin1 SET id_banco = ban2.banco
FROM financasmigration.bancos ban1, financas.bancos ban2
WHERE ban1.banco = fin1.id_banco
AND ban1.numero = ban2.numero;

INSERT INTO financas.finalidadespagamentosbancos
            (id,id_banco,codigo,descricao,disponivel,id_finalidadepagamentons,
             tipolayoutpagamento,lastupdate,tenant)
SELECT fin1.id,fin1.id_banco,fin1.codigo,fin1.descricao,fin1.disponivel,fin1.id_finalidadepagamentons,
       fin1.tipolayoutpagamento,fin1.lastupdate,fin1.tenant
FROM   financasmigration.finalidadespagamentosbancos fin1
LEFT JOIN financas.finalidadespagamentosbancos fin2 ON fin1.id_banco = fin2.id_banco AND fin1.codigo = fin2.codigo
WHERE fin2.id is null;

--financas.formaspagamentosbancos

UPDATE financasmigration.formaspagamentosbancos for1 SET id_banco = ban2.banco
FROM financasmigration.bancos ban1, financas.bancos ban2
WHERE ban1.banco = for1.id_banco
AND ban1.numero = ban2.numero;

INSERT INTO financas.formaspagamentosbancos
            (id,id_banco,tipolayoutpagamento,codigo,descricao,disponivel,
             lastupdate,tenant)
SELECT for1.id,for1.id_banco,for1.tipolayoutpagamento,for1.codigo,for1.descricao,for1.disponivel,for1.lastupdate,
       for1.tenant
FROM   financasmigration.formaspagamentosbancos for1
LEFT JOIN financas.formaspagamentosbancos for2 ON for1.id_banco = for2.id_banco AND for1.codigo = for2.codigo
WHERE for2.id is null;

--financas.finalidadespagamentosbancosformaspagbancos

UPDATE financasmigration.finalidadespagamentosbancosformaspagbancos fin1 SET id_finalidadepagamentobanco = fin3.id
FROM financasmigration.finalidadespagamentosbancos fin2, financas.finalidadespagamentosbancos fin3
WHERE fin1.id_finalidadepagamentobanco = fin2.id
AND fin2.codigo = fin3.codigo
AND fin2.id_banco = fin3.id_banco;

UPDATE financasmigration.finalidadespagamentosbancosformaspagbancos fin1 SET id_formapagamentobanco = for3.id
FROM financasmigration.formaspagamentosbancos for2, financas.formaspagamentosbancos for3
WHERE fin1.id_formapagamentobanco = for2.id
AND for2.codigo = for3.codigo;

INSERT INTO financas.finalidadespagamentosbancosformaspagbancos
            (id_formapagamentobanco,id_finalidadepagamentobanco,lastupdate,
             tenant)
SELECT DISTINCT ON (fin1.id_formapagamentobanco,fin1.id_finalidadepagamentobanco) fin1.id_formapagamentobanco,fin1.id_finalidadepagamentobanco,fin1.lastupdate,fin1.tenant
FROM   financasmigration.finalidadespagamentosbancosformaspagbancos fin1
LEFT JOIN financas.finalidadespagamentosbancosformaspagbancos fin2 ON fin1.id_formapagamentobanco = fin2.id_formapagamentobanco AND fin1.id_finalidadepagamentobanco = fin2.id_finalidadepagamentobanco
WHERE fin2.id_finalidadepagamentobanco is null;

--financas.finalidadespagamentosns

INSERT INTO financas.finalidadespagamentosns
            (id,codigo,descricao,disponivel,lastupdate,tenant)
SELECT fin1.id,fin1.codigo,fin1.descricao,fin1.disponivel,fin1.lastupdate,fin1.tenant
FROM   financasmigration.finalidadespagamentosns fin1
LEFT JOIN financas.finalidadespagamentosns fin2 ON fin1.codigo = fin2.codigo
WHERE fin2.id is null;

--financas.formaspagamentoporcontasfinanceiras

INSERT INTO financas.formaspagamentoporcontasfinanceiras
            (formapagamentoporcontafinanceira,estabelecimento,formapagamento,
             conta,lastupdate
             ,tenant)
SELECT for1.formapagamentoporcontafinanceira,for1.estabelecimento,for1.formapagamento,for1.conta,
       for1.lastupdate
       ,for1.tenant
FROM   financasmigration.formaspagamentoporcontasfinanceiras for1
LEFT JOIN financas.formaspagamentoporcontasfinanceiras for2 ON for1.estabelecimento = for2.estabelecimento AND for1.formapagamento = for2.formapagamento AND for1.conta = for2.conta
WHERE for2.formapagamentoporcontafinanceira is null;

--financas.servicosbancos

INSERT INTO financas.servicosbancos
            (id,id_banco,tipolayoutpagamento,codigo,descricao,disponivel,
             lastupdate,tenant)
SELECT ser1.id,ser1.id_banco,ser1.tipolayoutpagamento,ser1.codigo,ser1.descricao,ser1.disponivel,ser1.lastupdate,
       ser1.tenant
FROM   financasmigration.servicosbancos ser1
LEFT JOIN financas.servicosbancos ser2 ON ser1.id_banco = ser2.id_banco AND ser1.codigo = ser2.codigo
WHERE ser2.id is null;

--financas.formaspagamentosbancosservicosbancos

UPDATE financasmigration.formaspagamentosbancosservicosbancos for1 SET id_servicobanco = ser2.id
FROM financasmigration.servicosbancos ser1, financas.servicosbancos ser2
WHERE ser1.id = for1.id_servicobanco
AND ser1.id_banco = ser2.id_banco 
AND ser1.codigo = ser2.codigo;

UPDATE financasmigration.formaspagamentosbancosservicosbancos for1 SET id_formapagamentobanco = for3.id
FROM financasmigration.formaspagamentosbancos for2, financas.formaspagamentosbancos for3
WHERE for1.id_formapagamentobanco = for2.id
AND for3.id_banco = for2.id_banco 
AND for3.codigo = for2.codigo; 

INSERT INTO financas.formaspagamentosbancosservicosbancos
            (id_servicobanco,id_formapagamentobanco,lastupdate,tenant)
SELECT for1.id_servicobanco,for1.id_formapagamentobanco,for1.lastupdate,for1.tenant
FROM   financasmigration.formaspagamentosbancosservicosbancos for1
LEFT JOIN financas.formaspagamentosbancosservicosbancos for2 ON for1.id_servicobanco = for2.id_servicobanco AND for1.id_formapagamentobanco = for2.id_formapagamentobanco
WHERE for2.id_formapagamentobanco is null;

--financas.formaspagamentosns

INSERT INTO financas.formaspagamentosns
            (id,codigo,descricao,disponivel,lastupdate,tenant)
SELECT for1.id,for1.codigo,for1.descricao,for1.disponivel,for1.lastupdate,for1.tenant
FROM   financasmigration.formaspagamentosns for1
LEFT JOIN financas.formaspagamentosns for2 ON for1.codigo = for2.codigo
WHERE for2.id is null;

--financas.formaspagamentosnsservicosns

INSERT INTO financas.formaspagamentosnsservicosns
            (id_servicons,id_formapagamentons,lastupdate,tenant)
SELECT for1.id_servicons,for1.id_formapagamentons,for1.lastupdate,for1.tenant
FROM   financasmigration.formaspagamentosnsservicosns for1
LEFT JOIN financas.formaspagamentosnsservicosns for2 ON for1.id_servicons = for2.id_servicons AND for1.id_formapagamentons = for2.id_formapagamentons
WHERE for2.id_formapagamentons is null;

--financas.gestoresaplicacoes

INSERT INTO financas.gestoresaplicacoes
            (gestoraplicacao,codigo,descricao,lastupdate,tenant)
SELECT ges1.gestoraplicacao,ges1.codigo,ges1.descricao,ges1.lastupdate,ges1.tenant
FROM   financasmigration.gestoresaplicacoes ges1
LEFT JOIN financas.gestoresaplicacoes ges2 ON ges1.codigo = ges2.codigo
WHERE ges2.gestoraplicacao is null;

--financas.gruposclassificadores

INSERT INTO financas.gruposclassificadores
            (grupoclassificador,nome,relatoriogrupoclassificador,
             grupoclassificadorpai,ordem,--ultimonivel,multiplicadorgrupo,listahierarquica,
             lastupdate,tenant)
SELECT gru1.grupoclassificador,gru1.nome,gru1.relatoriogrupoclassificador,gru1.grupoclassificadorpai
       ,gru1.ordem,--gru1.ultimonivel,gru1.multiplicadorgrupo,gru1.listahierarquica,
       gru1.lastupdate,gru1.tenant
FROM   financasmigration.gruposclassificadores gru1
LEFT JOIN financas.gruposclassificadores gru2 ON gru1.nome = gru2.nome
WHERE gru2.grupoclassificador is null;

--financas.gruposcotacoes

INSERT INTO financas.gruposcotacoes
            (grupocotacao,codigo,lastupdate,tenant)
SELECT gru1.grupocotacao,gru1.codigo,gru1.lastupdate,gru1.tenant
FROM   financasmigration.gruposcotacoes gru1
LEFT JOIN financas.gruposcotacoes gru2 ON gru1.codigo = gru2.codigo
WHERE gru2.grupocotacao is null;

--financas.gruposcotgruposemp

INSERT INTO financas.gruposcotgruposemp
            (grupocotgrupoemp,grupocotacao,grupoempresarial,lastupdate,tenant)
SELECT gru1.grupocotgrupoemp,gru1.grupocotacao,gru1.grupoempresarial,gru1.lastupdate,gru1.tenant
FROM   financasmigration.gruposcotgruposemp gru1
LEFT JOIN financas.gruposcotgruposemp gru2 ON gru1.grupoempresarial = gru2.grupoempresarial AND gru1.grupocotacao = gru2.grupocotacao
WHERE gru2.grupocotgrupoemp is null;

--financas.gruposlancamentosexternos

INSERT INTO financas.gruposlancamentosexternos
            (grupolanctoexterno,codigo,descricao,datainicial,datafinal,
             titulogerado,
             locallanctoexterno,lastupdate,tenant)
SELECT gru1.grupolanctoexterno,gru1.codigo,gru1.descricao,gru1.datainicial,gru1.datafinal,gru1.titulogerado,
       gru1.locallanctoexterno,gru1.lastupdate,gru1.tenant
FROM   financasmigration.gruposlancamentosexternos gru1
LEFT JOIN financas.gruposlancamentosexternos gru2 ON gru1.codigo = gru2.codigo
WHERE gru2.grupolanctoexterno is null;

--financas.historicodespesamedica

INSERT INTO financas.historicodespesamedica
            (historicodespesamedica,despesamedica,data,origem,situacao,valor,
             planosaude,
             segurosaude,lastupdate,tenant)
SELECT his1.historicodespesamedica,his1.despesamedica,his1.data,his1.origem,his1.situacao,his1.valor,
       his1.planosaude,
       his1.segurosaude,his1.lastupdate,his1.tenant
FROM   financasmigration.historicodespesamedica his1
LEFT JOIN financas.historicodespesamedica his2 ON his1.despesamedica = his2.despesamedica AND his1.data = his2.data AND his1.origem = his2.origem AND his1.planosaude = his2.planosaude
WHERE his2.historicodespesamedica;

--financas.historicosanalisesinadimplencias

INSERT INTO financas.historicosanalisesinadimplencias
            (historicoanaliseinadimplencia,data,hora,grupoempresarial,usuario,
             login,
             nomeusuario,cliente,codigocliente,nomecliente,valordevido,
             diasematraso,tipoacao,transacao,complementoacao,
             codigocomplementoacao,reguacobrancaetapacontrole,efetivado,
             lastupdate,tenant)
SELECT his1.historicoanaliseinadimplencia,his1.data,his1.hora,his1.grupoempresarial,his1.usuario,his1.login,
       his1.nomeusuario,his1.cliente,his1.codigocliente,his1.nomecliente,his1.valordevido,his1.diasematraso,
       his1.tipoacao,his1.transacao,his1.complementoacao,his1.codigocomplementoacao,
       his1.reguacobrancaetapacontrole,his1.efetivado,his1.lastupdate,his1.tenant
FROM   financasmigration.historicosanalisesinadimplencias his1
LEFT JOIN financas.historicosanalisesinadimplencias his2 ON his1.grupoempresarial = his2.grupoempresarial AND his1.data = his2.data
WHERE his2.historicoanaliseinadimplencia is null;

--financas.historicosanalisesinadimplenciasitens

INSERT INTO financas.historicosanalisesinadimplenciasitens
            (historicoanaliseinadimplenciaitem,historicoanaliseinadimplencia,
             titulo,
             titulonumero,tituloemissao,titulovencimento,titulovalor,lastupdate,
             tenant)
SELECT his1.historicoanaliseinadimplenciaitem,his1.historicoanaliseinadimplencia,his1.titulo,
       his1.titulonumero,his1.tituloemissao,his1.titulovencimento,his1.titulovalor,his1.lastupdate,his1.tenant
FROM   financasmigration.historicosanalisesinadimplenciasitens his1
LEFT JOIN financas.historicosanalisesinadimplenciasitens his2 ON his1.titulo = his2.grupoempresarial AND his1.historicoanaliseinadimplencia = his2.historicoanaliseinadimplencia
WHERE his2.historicoanaliseinadimplenciaitem is null;

--financas.historicoschequescustodias

INSERT INTO financas.historicoschequescustodias
            (id,id_chequecustodia,id_titulo,id_usuario,data,login,nomeusuario,
             numero_titulo,
             valor_titulo,valor_utilizado,nomepessoa_titulo,acao,lastupdate,
             tenant)
SELECT id,id_chequecustodia,id_titulo,id_usuario,data,login,nomeusuario,
       numero_titulo,
       valor_titulo,valor_utilizado,nomepessoa_titulo,acao,lastupdate,tenant
FROM   financasmigration.historicoschequescustodias;

--financas.historicostitulos

INSERT INTO financas.historicostitulos
            (historicotitulo,id_titulo,id_usuario,tipotitulo,tipoalteracao,
             valoranterior,
             novovalor,processado,lastupdate,dataalteracao,tenant)
SELECT historicotitulo,id_titulo,id_usuario,tipotitulo,tipoalteracao,
       valoranterior,
       novovalor,processado,lastupdate,dataalteracao,tenant
FROM   financasmigration.historicostitulos;

--financas.inadimplenciasexcecoesclientes

INSERT INTO financas.inadimplenciasexcecoesclientes
            (id,diasatrasos,id_cliente,id_grupoempresarial,lastupdate,tenant)
SELECT id,diasatrasos,id_cliente,id_grupoempresarial,lastupdate,tenant
FROM   financasmigration.inadimplenciasexcecoesclientes;

--financas.indices

INSERT INTO financas.indices
            (indice,codigo,descricao,regracalculo,qtddecimais,lastupdate,tenant)
SELECT indice,codigo,descricao,regracalculo,qtddecimais,lastupdate,tenant
FROM   financasmigration.indices;

--financas.indicesdiarios

INSERT INTO financas.indicesdiarios
            (indicediario,codigo,descricao,regracalculo,qtddecimais,lastupdate,
             tenant)
SELECT indicediario,codigo,descricao,regracalculo,qtddecimais,lastupdate,tenant
FROM   financasmigration.indicesdiarios;

--financas.informacoescartoes

INSERT INTO financas.informacoescartoes
            (versao,tipooperacaocartao,bandeiracartao,informacaocartao,
             meioeletronico,
             operadoracartao,estabelecimento,lastupdate,tenant)
SELECT versao,tipooperacaocartao,bandeiracartao,informacaocartao,meioeletronico,
       operadoracartao,estabelecimento,lastupdate,tenant
FROM   financasmigration.informacoescartoes;

--financas.investimentos

INSERT INTO financas.investimentos
            (investimento,codigo,descricao,tipoinvestimento,codigoidentificador,
             qtdcotizacao,
             qtdliquidacao,gestoraplicacao,lastupdate,tenant)
SELECT investimento,codigo,descricao,tipoinvestimento,codigoidentificador,
       qtdcotizacao,
       qtdliquidacao,gestoraplicacao,lastupdate,tenant
FROM   financasmigration.investimentos;

--financas.irregularidadesbancarias

INSERT INTO financas.irregularidadesbancarias
            (data,inconsistencia,observacao,valor,dataregularizacao,situacao,
             versao,
             classificacaofinanceira,irregularidadebancaria,lancamentoconta,
             tituloreceber,tipo,valortarifacartao,tipooperacaocartao,lastupdate,
             tenant)
SELECT data,inconsistencia,observacao,valor,dataregularizacao,situacao,versao,
       classificacaofinanceira,irregularidadebancaria,lancamentoconta,
       tituloreceber,tipo,valortarifacartao,tipooperacaocartao,lastupdate,tenant
FROM   financasmigration.irregularidadesbancarias;

--financas.irregularidadesporrateios

INSERT INTO financas.irregularidadesporrateios
            (irregularidadeporrateio,irregularidade,rateiofinanceiro,lastupdate,
             tenant)
SELECT irregularidadeporrateio,irregularidade,rateiofinanceiro,lastupdate,tenant
FROM   financasmigration.irregularidadesporrateios;

--financas.irregularidadesportitulos

INSERT INTO financas.irregularidadesportitulos
            (irregularidadeportitulo,irregularidade,titulo,lastupdate,tenant)
SELECT irregularidadeportitulo,irregularidade,titulo,lastupdate,tenant
FROM   financasmigration.irregularidadesportitulos;

--financas.itensavisoslancamentos

INSERT INTO financas.itensavisoslancamentos
            (itemavisolancamento,lancamento,avisolancamento,numerolancamento,
             lastupdate,
             tenant)
SELECT itemavisolancamento,lancamento,avisolancamento,numerolancamento,
       lastupdate,
       tenant
FROM   financasmigration.itensavisoslancamentos;

--financas.itensavisostitulos

INSERT INTO financas.itensavisostitulos
            (itemavisotitulo,titulo,avisotitulo,lastupdate,tenant)
SELECT itemavisotitulo,titulo,avisotitulo,lastupdate,tenant
FROM   financasmigration.itensavisostitulos;

--financas.itensborderoseletronicos

INSERT INTO financas.itensborderoseletronicos
            (tipomovimentacao,situacao,versao,borderoeletronico,
             itemborderoeletronico,
             titulopagar,contafornecedor,valor,lastupdate,tenant)
SELECT tipomovimentacao,situacao,versao,borderoeletronico,itemborderoeletronico,
       titulopagar,contafornecedor,valor,lastupdate,tenant
FROM   financasmigration.itensborderoseletronicos;

--financas.itenscenariosorcamentarios

INSERT INTO financas.itenscenariosorcamentarios
            (itemcenarioorcamentario,cenarioorcamentario,mes,valor,
             classificacaofinanceira,
             centrocusto,projeto,bempatrimonial,estabelecimento,orcamento,ano,
             lastupdate,tenant)
SELECT itemcenarioorcamentario,cenarioorcamentario,mes,valor,
       classificacaofinanceira,
       centrocusto,projeto,bempatrimonial,estabelecimento,orcamento,ano,
       lastupdate,tenant
FROM   financasmigration.itenscenariosorcamentarios;

--financas.itenschequescustodiasendossos

INSERT INTO financas.itenschequescustodiasendossos
            (id,id_chequecustodia,id_titulo,id_baixa,numero_titulo,
             emissao_titulo,
             vencimento_titulo,valor_titulo,valor_pago,nomefornecedor_titulo,
             lastupdate,tenant)
SELECT id,id_chequecustodia,id_titulo,id_baixa,numero_titulo,emissao_titulo,
       vencimento_titulo,valor_titulo,valor_pago,nomefornecedor_titulo,
       lastupdate,tenant
FROM   financasmigration.itenschequescustodiasendossos;

--financas.itenschequescustodiasrecebimentos

INSERT INTO financas.itenschequescustodiasrecebimentos
            (id,id_chequecustodia,id_titulo,id_baixa,numero_titulo,
             emissao_titulo,
             vencimento_titulo,valor_titulo,nomecliente_titulo,
             codigoconta_titulo,valorusadonabaixa,lastupdate,tenant)
SELECT id,id_chequecustodia,id_titulo,id_baixa,numero_titulo,emissao_titulo,
       vencimento_titulo,valor_titulo,nomecliente_titulo,codigoconta_titulo,
       valorusadonabaixa,lastupdate,tenant
FROM   financasmigration.itenschequescustodiasrecebimentos;

--financas.itenschequespagamentos

INSERT INTO financas.itenschequespagamentos
            (id,id_titulo,id_chequepagamento,valor,id_baixa,lastupdate,tenant)
SELECT id,id_titulo,id_chequepagamento,valor,id_baixa,lastupdate,tenant
FROM   financasmigration.itenschequespagamentos;

--financas.itenscobrancas

INSERT INTO financas.itenscobrancas
            (proximoreajuste,proximacobranca,validadeilimitada,dataexpiracao,
             codigocontabil,
             valortotal,quantidadeintervalocobranca,situacao,quantidade,
             tipoperiodocobranca,templatereferencia,valor,vigencia,versao,
             itemcobranca,participante,servico,cobrancarecorrente,
             id_objetoservico,id_docfis,id_cfop,id_objetoservicoitem,lastupdate,
             tenant)
SELECT proximoreajuste,proximacobranca,validadeilimitada,dataexpiracao,
       codigocontabil,
       valortotal,quantidadeintervalocobranca,situacao,quantidade,
       tipoperiodocobranca,templatereferencia,valor,vigencia,versao,itemcobranca
       ,participante,servico,cobrancarecorrente,id_objetoservico,id_docfis,
       id_cfop,id_objetoservicoitem,lastupdate,tenant
FROM   financasmigration.itenscobrancas;

--financas.itenscobrancasprocessadas

INSERT INTO financas.itenscobrancasprocessadas
            (vencimento,inicioreferencia,fimreferencia,quantidade,valortotal,
             valor,versao,
             tipoprorata,cobrancaaposservico,itemcobranca,itemcobrancaprocessada
             ,tituloreceber,rps,rps_id,lastupdate,tenant)
SELECT vencimento,inicioreferencia,fimreferencia,quantidade,valortotal,valor,
       versao,
       tipoprorata,cobrancaaposservico,itemcobranca,itemcobrancaprocessada,
       tituloreceber,rps,rps_id,lastupdate,tenant
FROM   financasmigration.itenscobrancasprocessadas;

--financas.itensconciliacoeslancamentos

INSERT INTO financas.itensconciliacoeslancamentos
            (versao,conciliacaolancamento,itemconciliacaolancamento,lastupdate,
             tenant)
SELECT versao,conciliacaolancamento,itemconciliacaolancamento,lastupdate,tenant
FROM   financasmigration.itensconciliacoeslancamentos;

--financas.alteracoescontratos

INSERT INTO financas.alteracoescontratos
            (alteracaocontrato,tipo,origem,status,dataprincipal,dataauxiliar,
             itemcontrato,
             itemnotacobranca,contrato,usuario,lastupdate,valor,
             tiposuspensaoanterior,tipovencimentoatual,diavencimentoatual,
             adicaomesesvencimentoatual,tipovencimentonovo,diavencimentonovo,
             adicaomesesvencimentonovo,tenant)
SELECT alteracaocontrato,tipo,origem,status,dataprincipal,dataauxiliar,
       itemcontrato,
       itemnotacobranca,contrato,usuario,lastupdate,valor,tiposuspensaoanterior,
       tipovencimentoatual,diavencimentoatual,adicaomesesvencimentoatual,
       tipovencimentonovo,diavencimentonovo,adicaomesesvencimentonovo,tenant
FROM   financasmigration.alteracoescontratos;

--financas.acoescontratos

INSERT INTO financas.acoescontratos
            (acaocontrato,contrato,servicotecnico,unidadeocorrencia,
             intervaloocorrencia,
             fatorocorrencia,lastupdate,tenant)
SELECT acaocontrato,contrato,servicotecnico,unidadeocorrencia,
       intervaloocorrencia,
       fatorocorrencia,lastupdate,tenant
FROM   financasmigration.acoescontratos;

--financas.itenscontratosvendedores

INSERT INTO financas.itenscontratosvendedores
            (idvendedor,comissao,itemcontratovendedor,iditemcontrato,lastupdate,
             tenant)
SELECT idvendedor,comissao,itemcontratovendedor,iditemcontrato,lastupdate,tenant
FROM   financasmigration.itenscontratosvendedores;

--financas.itensemprestimoprestacoesdecontas

INSERT INTO financas.itensemprestimoprestacoesdecontas
            (id,id_prestacaodeconta,id_tituloemprestimo,lastupdate,tenant)
SELECT id,id_prestacaodeconta,id_tituloemprestimo,lastupdate,tenant
FROM   financasmigration.itensemprestimoprestacoesdecontas;

--financas.itensfaturas

INSERT INTO financas.itensfaturas
            (id,id_fatura,id_docfis,lastupdate,tenant)
SELECT id,id_fatura,id_docfis,lastupdate,tenant
FROM   financasmigration.itensfaturas;

--financas.itensmodeloscontratos

INSERT INTO financas.itensmodeloscontratos
            (itemmodelocontrato,modelocontrato,servico,codigo,observacao,
             antecipar,tipovalor,
             lastupdate,tenant)
SELECT itemmodelocontrato,modelocontrato,servico,codigo,observacao,antecipar,
       tipovalor,
       lastupdate,tenant
FROM   financasmigration.itensmodeloscontratos;

--financas.itensprestacoesdecontas

INSERT INTO financas.itensprestacoesdecontas
            (id,id_prestacaodeconta,id_titulo,lastupdate,tenant)
SELECT id,id_prestacaodeconta,id_titulo,lastupdate,tenant
FROM   financasmigration.itensprestacoesdecontas;

--financas.itenspreviasrenegociacoescontratos

INSERT INTO financas.itenspreviasrenegociacoescontratos
            (itempreviarenegociacaocontrato,id_renegociacaocontrato,parcela,
             emissao,
             vencimento,valor_ocorrencia,valordesconto_ocorrencia,
             valoracrescimo_ocorrencia,valortotal_ocorrencia,titulogerado,
             valor_contrato,lastupdate,tenant)
SELECT itempreviarenegociacaocontrato,id_renegociacaocontrato,parcela,emissao,
       vencimento,valor_ocorrencia,valordesconto_ocorrencia,
       valoracrescimo_ocorrencia,valortotal_ocorrencia,titulogerado,
       valor_contrato,lastupdate,tenant
FROM   financasmigration.itenspreviasrenegociacoescontratos;

--financas.itenspreviasrengcontratos_ocorrencias

INSERT INTO financas.itenspreviasrengcontratos_ocorrencias
            (itempreviarengcontrato_ocorrencia,itempreviarenegociacaocontrato,
             id_ocorrenciacontrato,lastupdate,tenant)
SELECT itempreviarengcontrato_ocorrencia,itempreviarenegociacaocontrato,
       id_ocorrenciacontrato,lastupdate,tenant
FROM   financasmigration.itenspreviasrengcontratos_ocorrencias;

--financas.itensrenegociacoescontratostitulosgerados

INSERT INTO financas.itensrenegociacoescontratostitulosgerados
            (itemrenegociacaocontratotitulogerado,id_renegociacaocontrato,
             id_tituloreceber,
             numero_titulo,emissao_titulo,vencimento_titulo,valor_contrato,
             valor_renegociacao,valor_total,lastupdate,tenant)
SELECT itemrenegociacaocontratotitulogerado,id_renegociacaocontrato,
       id_tituloreceber,
       numero_titulo,emissao_titulo,vencimento_titulo,valor_contrato,
       valor_renegociacao,valor_total,lastupdate,tenant
FROM   financasmigration.itensrenegociacoescontratostitulosgerados;

--financas.itensrenegociadoscontratos

INSERT INTO financas.itensrenegociadoscontratos
            (itemrenegociadocontrato,id_renegociacaocontrato,id_tituloreceber,
             codigo_contrato
             ,numero_titulo,emissao_titulo,vencimento_titulo,valor_titulo,
             valor_titulopago,total_titulo,lastupdate,tenant)
SELECT itemrenegociadocontrato,id_renegociacaocontrato,id_tituloreceber,
       codigo_contrato
       ,numero_titulo,emissao_titulo,vencimento_titulo,valor_titulo,
       valor_titulopago,total_titulo,lastupdate,tenant
FROM   financasmigration.itensrenegociadoscontratos;

--financas.itensresgates

INSERT INTO financas.itensresgates
            (itemresgate,resgate,aplicacao,valor,valorir,valoriof,
             lancamentoconta,quantidade,
             taxasadministrativas,documentorateado,lastupdate,tenant)
SELECT itemresgate,resgate,aplicacao,valor,valorir,valoriof,lancamentoconta,
       quantidade,
       taxasadministrativas,documentorateado,lastupdate,tenant
FROM   financasmigration.itensresgates;

--financas.itenstaloescheques

INSERT INTO financas.itenstaloescheques
            (itemtalaocheque,talaocheque,numero,descricao,tipo,lastupdate,tenant
)
SELECT itemtalaocheque,talaocheque,numero,descricao,tipo,lastupdate,tenant
FROM   financasmigration.itenstaloescheques;

--financas.itenstaloeschequeshistoricos

INSERT INTO financas.itenstaloeschequeshistoricos
            (itemtalaochequehistorico,itemtalaocheque,descricao,data,usuario,
             lastupdate,
             tenant)
SELECT itemtalaochequehistorico,itemtalaocheque,descricao,data,usuario,
       lastupdate,
       tenant
FROM   financasmigration.itenstaloeschequeshistoricos;

--financas.lancamentosbancarios

INSERT INTO financas.lancamentosbancarios
            (data,historico,documento,sinal,valor,versao,
             itemconciliacaolancamento,
             lancamentobancario,situacao,conta,usuario,comentario,chave,
             lastupdate,tenant)
SELECT data,historico,documento,sinal,valor,versao,itemconciliacaolancamento,
       lancamentobancario,situacao,conta,usuario,comentario,chave,lastupdate,
       tenant
FROM   financasmigration.lancamentosbancarios;

--financas.lancamentosconciliados

INSERT INTO financas.lancamentosconciliados
            (tipoconciliacao,versao,itemconciliacaolancamento,
             lancamentoconciliado,
             lancamentoconta,lastupdate,tenant)
SELECT tipoconciliacao,versao,itemconciliacaolancamento,lancamentoconciliado,
       lancamentoconta,lastupdate,tenant
FROM   financasmigration.lancamentosconciliados;

--financas.lancamentosexternos

INSERT INTO financas.lancamentosexternos
            (lanctoexterno,data,classificacaolanctoexterno,
             subclassificacaolanctoexterno,
             descricao,valor,sinal,procedencia,conciliado,detalhe,observacao,
             locallanctoexterno,numero,grupolanctoexterno,vinculado,lastupdate,
             tenant)
SELECT lanctoexterno,data,classificacaolanctoexterno,
       subclassificacaolanctoexterno,
       descricao,valor,sinal,procedencia,conciliado,detalhe,observacao,
       locallanctoexterno,numero,grupolanctoexterno,vinculado,lastupdate,tenant
FROM   financasmigration.lancamentosexternos;

--financas.lancamentostituloscoberturascontas

INSERT INTO financas.lancamentostituloscoberturascontas
            (id,idtitulo,idlancamento,idgrupoempresarial,lastupdate,tenant)
SELECT id,idtitulo,idlancamento,idgrupoempresarial,lastupdate,tenant
FROM   financasmigration.lancamentostituloscoberturascontas;

--financas.layoutscobrancascartoes

INSERT INTO financas.layoutscobrancascartoes
            (nome,implementacao,versao,layoutcobrancacartao,meioeletronicocartao
             ,lastupdate,
             tenant)
SELECT nome,implementacao,versao,layoutcobrancacartao,meioeletronicocartao,
       lastupdate,
       tenant
FROM   financasmigration.layoutscobrancascartoes;

--financas.layoutscustodiacheques

INSERT INTO financas.layoutscustodiacheques
            (layoutcustodiacheque,nome,implementacao,id_banco,bloqueado,
             lastupdate,tenant)
SELECT layoutcustodiacheque,nome,implementacao,id_banco,bloqueado,lastupdate,
       tenant
FROM   financasmigration.layoutscustodiacheques;

--financas.layoutsimpressorascheques

INSERT INTO financas.layoutsimpressorascheques
            (id,codigo,descricao,id_banco,id_layoutrelatorio,lastupdate,tenant)
SELECT id,codigo,descricao,id_banco,id_layoutrelatorio,lastupdate,tenant
FROM   financasmigration.layoutsimpressorascheques;

--financas.layoutspagamentos

INSERT INTO financas.layoutspagamentos
            (descricao,tipolayoutpagamento,versao,banco,layoutpagamento,
             lastupdate,tenant)
SELECT descricao,tipolayoutpagamento,versao,banco,layoutpagamento,lastupdate,
       tenant
FROM   financasmigration.layoutspagamentos;

--financas.locaislancamentosexternos

INSERT INTO financas.locaislancamentosexternos
            (locallanctoexterno,codigo,descricao,descricaoabrev,
             tipodescritivorateio,
             datafechamento,lastupdate,tenant)
SELECT locallanctoexterno,codigo,descricao,descricaoabrev,tipodescritivorateio,
       datafechamento,lastupdate,tenant
FROM   financasmigration.locaislancamentosexternos;

--financas.logotiposbenspatrimoniais

INSERT INTO financas.logotiposbenspatrimoniais
            (logotipobempatrimonial,bempatrimonial,logotipo,ordem,lastupdate,
             tenant)
SELECT logotipobempatrimonial,bempatrimonial,logotipo,ordem,lastupdate,tenant
FROM   financasmigration.logotiposbenspatrimoniais;

--financas.lotesfaturas

INSERT INTO financas.lotesfaturas
            (id,estabelecimento,numero,emissao,datacriacao,usuario,datainicio,
             datafim,
             poremissao,tiposelecaocliente,diainicioselecao,diafimselecao,
             lastupdate,tenant)
SELECT id,estabelecimento,numero,emissao,datacriacao,usuario,datainicio,datafim,
       poremissao,tiposelecaocliente,diainicioselecao,diafimselecao,lastupdate,
       tenant
FROM   financasmigration.lotesfaturas;

--financas.meioseletronicoscartoes

INSERT INTO financas.meioseletronicoscartoes
            (codigo,versao,meioeletronicocartao,lastupdate,tenant)
SELECT codigo,versao,meioeletronicocartao,lastupdate,tenant
FROM   financasmigration.meioseletronicoscartoes;

--financas.mensagenslotesfaturas

INSERT INTO financas.mensagenslotesfaturas
            (id_lote,tipo,datahora,mensagem,lastupdate,tenant)
SELECT id_lote,tipo,datahora,mensagem,lastupdate,tenant
FROM   financasmigration.mensagenslotesfaturas;

--financas.modelosatividadescontratos

INSERT INTO financas.modelosatividadescontratos
            (modeloatividadecontrato,atividadecontrato_id,modeloobjetoservico_id
             ,lastupdate,
             tenant)
SELECT modeloatividadecontrato,atividadecontrato_id,modeloobjetoservico_id,
       lastupdate,
       tenant
FROM   financasmigration.modelosatividadescontratos;

--financas.modeloscontratos

INSERT INTO financas.modeloscontratos
            (modelocontrato,codigo,descricao,tipocontrato,obrigatoriobem,
             obrigatoriofiador,
             obrigatorioadministradorlegal,definicaocontratante,
             definicaobeneficiario,qtddiasdesconto,qtddiasmulta,
             qtddiasjurosdiarios,id_grupo,emitirnotafiscal,tipocontabilizacao,
             lastupdate,tenant)
SELECT modelocontrato,codigo,descricao,tipocontrato,obrigatoriobem,
       obrigatoriofiador,
       obrigatorioadministradorlegal,definicaocontratante,definicaobeneficiario,
       qtddiasdesconto,qtddiasmulta,qtddiasjurosdiarios,id_grupo,
       emitirnotafiscal,tipocontabilizacao,lastupdate,tenant
FROM   financasmigration.modeloscontratos;

--financas.naturezasitensmodeloscontratos

INSERT INTO financas.naturezasitensmodeloscontratos
            (naturezaitemmodcontrato,modelocontrato,itemmodelocontrato,
             qtddiasparainicio,
             qtddiasparafim,qtdmesesparareajuste,percentualdesconto,
             percentualmulta,percentualjurosdiarios,qtddiasvigencia,unidade,
             unidadeintervalo,quantidadeintervalo,tipovencimento,diavencimento,
             adicaomesesvencimento,tipocobranca,indice,dataproximoreajuste,
             considerardatainicio,parcelainicial,parcelafinal,parcelaatual,
             processaperiodoanterior,tipoemissao,qtddiasemissaotitulo,
             reajusteautomatico,usarindicevariavel,lastupdate,tenant)
SELECT naturezaitemmodcontrato,modelocontrato,itemmodelocontrato,
       qtddiasparainicio,
       qtddiasparafim,qtdmesesparareajuste,percentualdesconto,percentualmulta,
       percentualjurosdiarios,qtddiasvigencia,unidade,unidadeintervalo,
       quantidadeintervalo,tipovencimento,diavencimento,adicaomesesvencimento,
       tipocobranca,indice,dataproximoreajuste,considerardatainicio,
       parcelainicial,parcelafinal,parcelaatual,processaperiodoanterior,
       tipoemissao,qtddiasemissaotitulo,reajusteautomatico,usarindicevariavel,
       lastupdate,tenant
FROM   financasmigration.naturezasitensmodeloscontratos;

--financas.objetosatividadescontratos

INSERT INTO financas.objetosatividadescontratos
            (objetoatividadecontrato,atividadecontrato_id,objetoservico_id,
             lastupdate,tenant)
SELECT objetoatividadecontrato,atividadecontrato_id,objetoservico_id,lastupdate,
       tenant
FROM   financasmigration.objetosatividadescontratos;

--financas.objetoscontratos

INSERT INTO financas.objetoscontratos
            (objetocontrato,contrato_id,objetoservico_id,valor,lastupdate,tenant
)
SELECT objetocontrato,contrato_id,objetoservico_id,valor,lastupdate,tenant
FROM   financasmigration.objetoscontratos;

--financas.ocorrenciasbancariasrejeicoes

INSERT INTO financas.ocorrenciasbancariasrejeicoes
            (ocorrenciabancariarejeicao,implementacaolayout,codigo,descricao,
             lastupdate,
             tenant)
SELECT ocorrenciabancariarejeicao,implementacaolayout,codigo,descricao,
       lastupdate,
       tenant
FROM   financasmigration.ocorrenciasbancariasrejeicoes;

--financas.ocorrenciascontratos

INSERT INTO financas.ocorrenciascontratos
            (ocorrenciacontrato,itemcontrato,processamentocontrato,tipo,ndias,
             valor,
             observacao,data,dia,semana,mes,ano,geradoporrenegociacao,
             valorprincipalrenegociacao,usuarioresponsavel,usuariologado,
             ativacaorenegociacao,lastupdate,tenant)
SELECT ocorrenciacontrato,itemcontrato,processamentocontrato,tipo,ndias,valor,
       observacao,data,dia,semana,mes,ano,geradoporrenegociacao,
       valorprincipalrenegociacao,usuarioresponsavel,usuariologado,
       ativacaorenegociacao,lastupdate,tenant
FROM   financasmigration.ocorrenciascontratos;

--financas.operacaoirregularidade

INSERT INTO financas.operacaoirregularidade
            (id,descricao,lastupdate,tenant)
SELECT id,descricao,lastupdate,tenant
FROM   financasmigration.operacaoirregularidade;

--financas.operacoescartoes

INSERT INTO financas.operacoescartoes
            (operacaocartao,descricao,lastupdate,tenant)
SELECT operacaocartao,descricao,lastupdate,tenant
FROM   financasmigration.operacoescartoes;

--financas.operadorascartoes

INSERT INTO financas.operadorascartoes
            (codigo,versao,operadoracartao,lastupdate,tenant)
SELECT codigo,versao,operadoracartao,lastupdate,tenant
FROM   financasmigration.operadorascartoes;

--financas.orcamentos

INSERT INTO financas.orcamentos
            (orcamento,descricao,aprovado,data_criacao,cenarioorcamentario,
             lastupdate,tenant)
SELECT orcamento,descricao,aprovado,data_criacao,cenarioorcamentario,lastupdate,
       tenant
FROM   financasmigration.orcamentos;

--financas.periodos

INSERT INTO financas.periodos
            (periodo,dataentrada,datasaida,situacao,lastupdate,membrofamilia,
             tenant)
SELECT periodo,dataentrada,datasaida,situacao,lastupdate,membrofamilia,tenant
FROM   financasmigration.periodos;

--financas.planossaude

INSERT INTO financas.planossaude
            (planosaude,codigo,nome,diassolicitacaoreembolso,diasprazoreembolso,
             lastupdate,
             tenant)
SELECT planosaude,codigo,nome,diassolicitacaoreembolso,diasprazoreembolso,
       lastupdate,
       tenant
FROM   financasmigration.planossaude;

--financas.prestacoesdecontas

INSERT INTO financas.prestacoesdecontas
            (id,numero,data,id_contaemprestimo,situacao,id_grupoempresarial,
             documentorateado,
             valorespecie,id_contaespecie,id_estabelecimento,id_fornecedor,
             valorperdoado,datalancamento,tipo,lastupdate,tenant)
SELECT id,numero,data,id_contaemprestimo,situacao,id_grupoempresarial,
       documentorateado,
       valorespecie,id_contaespecie,id_estabelecimento,id_fornecedor,
       valorperdoado,datalancamento,tipo,lastupdate,tenant
FROM   financasmigration.prestacoesdecontas;

--financas.previsoespagar

INSERT INTO financas.previsoespagar
            (codigo,valor,datainicio,datatermino,dataproximolancamento,
             duracaofinita,
             frequencia,diasintervalofixo,observacao,codigocontabil,versao,
             tipocontabilizacao,conta,documentorateado,previsaopagar,
             estabelecimento,participante,anteciparprevisao,cancelado,lastupdate
             ,tenant)
SELECT codigo,valor,datainicio,datatermino,dataproximolancamento,duracaofinita,
       frequencia,diasintervalofixo,observacao,codigocontabil,versao,
       tipocontabilizacao,conta,documentorateado,previsaopagar,estabelecimento,
       participante,anteciparprevisao,cancelado,lastupdate,tenant
FROM   financasmigration.previsoespagar;

--financas.previsoesreceber

INSERT INTO financas.previsoesreceber
            (codigo,valor,datainicio,datatermino,dataproximolancamento,
             duracaofinita,
             frequencia,diasintervalofixo,observacao,codigocontabil,versao,conta
             ,documentorateado,previsaoreceber,estabelecimento,participante,
             anteciparprevisao,lastupdate,tenant)
SELECT codigo,valor,datainicio,datatermino,dataproximolancamento,duracaofinita,
       frequencia,diasintervalofixo,observacao,codigocontabil,versao,conta,
       documentorateado,previsaoreceber,estabelecimento,participante,
       anteciparprevisao,lastupdate,tenant
FROM   financasmigration.previsoesreceber;

--financas.projetosclientes

INSERT INTO financas.projetosclientes
            (projetocliente,id_projeto,cliente_id,lastupdate,tenant)
SELECT projetocliente,id_projeto,cliente_id,lastupdate,tenant
FROM   financasmigration.projetosclientes;

--financas.projetosclientes

INSERT INTO financas.projetosclientes
            (projetocliente,id_projeto,cliente_id,lastupdate,tenant)
SELECT projetocliente,id_projeto,cliente_id,lastupdate,tenant
FROM   financasmigration.projetosclientes;

--financas.projetosgestores

INSERT INTO financas.projetosgestores
            (projetogestor,id_projeto,id_gestor,percentual_gestor,lastupdate,
             tenant)
SELECT projetogestor,id_projeto,id_gestor,percentual_gestor,lastupdate,tenant
FROM   financasmigration.projetosgestores;

--financas.rateiosfinanceiros

INSERT INTO financas.rateiosfinanceiros
            (valor,versao,centrocusto,classificacaofinanceira,documentorateado,
             rateiofinanceiro,projeto,itemcontrato,discriminacao,percentual,
             bempatrimonial,criacaoautomatica,idrateiofinanceiroorigem,
             id_estabelecimento_reembolso,lastupdate,tenant)
SELECT valor,versao,centrocusto,classificacaofinanceira,documentorateado,
       rateiofinanceiro,projeto,itemcontrato,discriminacao,percentual,
       bempatrimonial,criacaoautomatica,idrateiofinanceiroorigem,
       id_estabelecimento_reembolso,lastupdate,tenant
FROM   financasmigration.rateiosfinanceiros;

--financas.rateioslancamentosexternos

INSERT INTO financas.rateioslancamentosexternos
            (rateiolanctoexterno,lanctoexterno,centrocustolanctoexterno,
             lastupdate,tenant)
SELECT rateiolanctoexterno,lanctoexterno,centrocustolanctoexterno,lastupdate,
       tenant
FROM   financasmigration.rateioslancamentosexternos;

--financas.rateiospadraovalores

INSERT INTO financas.rateiospadraovalores
            (percentual,versao,centrocusto,classificacao,rateiopadrao,
             rateiopadraovalor,
             projeto,discriminacao,lastupdate,tenant)
SELECT percentual,versao,centrocusto,classificacao,rateiopadrao,
       rateiopadraovalor,
       projeto,discriminacao,lastupdate,tenant
FROM   financasmigration.rateiospadraovalores;

--financas.reembolsos

INSERT INTO financas.reembolsos
            (reembolso,id_estabelecimento,id_pessoa,id_funcionario,valor,
             valor_regularizado,
             situacao,historico,id_titulo,id_lancamento,
             id_titulo_reembolsos_pagar,id_titulo_reembolsos_receber,
             id_rateiofinanceiro,lastupdate,tenant)
SELECT reembolso,id_estabelecimento,id_pessoa,id_funcionario,valor,
       valor_regularizado,
       situacao,historico,id_titulo,id_lancamento,id_titulo_reembolsos_pagar,
       id_titulo_reembolsos_receber,id_rateiofinanceiro,lastupdate,tenant
FROM   financasmigration.reembolsos;

--financas.reembolsosdespesamedica

INSERT INTO financas.reembolsosdespesamedica
            (reembolsodespesamedica,despesamedica,datasolicitacao,
             valorsolicitado,planosaude,
             segurosaude,dataquitacao,valorquitado,valorquitadomoedaseguro,
             datarecusa,motivorecusa,tipo,lastupdate,situacao,lancamentoconta,
             tenant)
SELECT reembolsodespesamedica,despesamedica,datasolicitacao,valorsolicitado,
       planosaude,
       segurosaude,dataquitacao,valorquitado,valorquitadomoedaseguro,datarecusa,
       motivorecusa,tipo,lastupdate,situacao,lancamentoconta,tenant
FROM   financasmigration.reembolsosdespesamedica;

--financas.reembolsospessoas

INSERT INTO financas.reembolsospessoas
            (reembolsopessoa,numero,emissao,pessoa,situacao,estabelecimento,
             conta,
             formapagamento,utilizarrateiotitulos,rateiopadrao,titulogerado,
             qtdtitulosreembolsados,valorreembolsado,lastupdate,tenant)
SELECT reembolsopessoa,numero,emissao,pessoa,situacao,estabelecimento,conta,
       formapagamento,utilizarrateiotitulos,rateiopadrao,titulogerado,
       qtdtitulosreembolsados,valorreembolsado,lastupdate,tenant
FROM   financasmigration.reembolsospessoas;

--financas.reembolsospessoasitens

INSERT INTO financas.reembolsospessoasitens
            (reembolsopessoaitem,reembolsopessoa,titulo,lastupdate,tenant)
SELECT reembolsopessoaitem,reembolsopessoa,titulo,lastupdate,tenant
FROM   financasmigration.reembolsospessoasitens;

--financas.reembolsossolucionados

INSERT INTO financas.reembolsossolucionados
            (reembolsosolucionado,id_reembolso,id_lancamento,lastupdate,tenant)
SELECT reembolsosolucionado,id_reembolso,id_lancamento,lastupdate,tenant
FROM   financasmigration.reembolsossolucionados;

--financas.reguascobrancas

INSERT INTO financas.reguascobrancas
            (reguacobranca,codigo,descricao,grupoempresarial,lastupdate,tenant)
SELECT reguacobranca,codigo,descricao,grupoempresarial,lastupdate,tenant
FROM   financasmigration.reguascobrancas;

--financas.reguascobrancasetapascontrole

INSERT INTO financas.reguascobrancasetapascontrole
            (reguacobrancaetapacontrole,codigo,descricao,prazosinal,prazodias,
             enviaremail,
             templateemail,enviarsms,templatesms,ativarrestricao,
             restricaocobranca,suspendercontratos,tornarinadimplente,
             cancelarcontratos,reguacobranca,somenterenegociados_suspensao,
             origenstitulos,zerarpontosfidelidade,lastupdate,tenant)
SELECT reguacobrancaetapacontrole,codigo,descricao,prazosinal,prazodias,
       enviaremail,
       templateemail,enviarsms,templatesms,ativarrestricao,restricaocobranca,
       suspendercontratos,tornarinadimplente,cancelarcontratos,reguacobranca,
       somenterenegociados_suspensao,origenstitulos,zerarpontosfidelidade,
       lastupdate,tenant
FROM   financasmigration.reguascobrancasetapascontrole;

--financas.relatoriosgruposclassificadores

INSERT INTO financas.relatoriosgruposclassificadores
            (relatoriogrupoclassificador,grupoempresarial,nome,tipodinamico,
             lastupdate,tenant)
SELECT relatoriogrupoclassificador,grupoempresarial,nome,tipodinamico,lastupdate
       ,tenant
FROM   financasmigration.relatoriosgruposclassificadores;

--financas.rendimentosdiariosaplicacoes

INSERT INTO financas.rendimentosdiariosaplicacoes
            (rendimentodiarioapliacacao,aplicacao,data,valor,lastupdate,tenant)
SELECT rendimentodiarioapliacacao,aplicacao,data,valor,lastupdate,tenant
FROM   financasmigration.rendimentosdiariosaplicacoes;

--financas.renegociacoescontratos

INSERT INTO financas.renegociacoescontratos
            (renegociacaocontrato,id_contrato,id_cliente,id_estabelecimento,
             id_grupoempresarial,id_usuarioresponsavel,id_usuariologado,numero,
             emissao,totalparcelas,totalrenegociado,status,lastupdate,tenant)
SELECT renegociacaocontrato,id_contrato,id_cliente,id_estabelecimento,
       id_grupoempresarial,id_usuarioresponsavel,id_usuariologado,numero,emissao
       ,totalparcelas,totalrenegociado,status,lastupdate,tenant
FROM   financasmigration.renegociacoescontratos;

--financas.renegociacoestitulos

INSERT INTO financas.renegociacoestitulos
            (id,estabelecimento,pessoa,datarenegociacao,numero,usuario,
             processado,tipo,
             qtdtitulosrenegociados,valortitulosrenegociados,desconto,acrescimo,
             acaoimpostos,observacao,lastupdate,tenant)
SELECT id,estabelecimento,pessoa,datarenegociacao,numero,usuario,processado,tipo
       ,
       qtdtitulosrenegociados,valortitulosrenegociados,desconto,acrescimo,
       acaoimpostos,observacao,lastupdate,tenant
FROM   financasmigration.renegociacoestitulos;

--financas.resgates

INSERT INTO financas.resgates
            (resgate,codigo,descricao,data,investimento,valor,
             taxasadministrativas,motivo,
             status,grupoempresarial,quantidade,tiporesgate,datacotizacao,
             dataliquidacao,gestoraplicacao,conta,lastupdate,tenant)
SELECT resgate,codigo,descricao,data,investimento,valor,taxasadministrativas,
       motivo,
       status,grupoempresarial,quantidade,tiporesgate,datacotizacao,
       dataliquidacao,gestoraplicacao,conta,lastupdate,tenant
FROM   financasmigration.resgates;

--financas.restricoescobrancas

INSERT INTO financas.restricoescobrancas
            (restricaocobranca,codigo,descricao,grupoempresarial,lastupdate,
             tenant)
SELECT restricaocobranca,codigo,descricao,grupoempresarial,lastupdate,tenant
FROM   financasmigration.restricoescobrancas;

--financas.retencoestitulosreceber

INSERT INTO financas.retencoestitulosreceber
            (mes,ano,baseretencoes,baseretida,versao,retencaotituloreceber,
             tituloreceber,
             tituloreceberretido,participante,lastupdate,tenant)
SELECT mes,ano,baseretencoes,baseretida,versao,retencaotituloreceber,
       tituloreceber,
       tituloreceberretido,participante,lastupdate,tenant
FROM   financasmigration.retencoestitulosreceber;

--financas.saldosreaiscontas

INSERT INTO financas.saldosreaiscontas
            (saldorealconta,conta,data,valor,lastupdate,tenant)
SELECT saldorealconta,conta,data,valor,lastupdate,tenant
FROM   financasmigration.saldosreaiscontas;

--financas.segurossaude

INSERT INTO financas.segurossaude
            (segurosaude,codigo,nome,valorfranquia,moeda,lastupdate,tenant)
SELECT segurosaude,codigo,nome,valorfranquia,moeda,lastupdate,tenant
FROM   financasmigration.segurossaude;

--financas.sequenceslancamentos

INSERT INTO financas.sequenceslancamentos
            (sequencelancamento,numero,documento,nomesequence,lastupdate,tenant)
SELECT sequencelancamento,numero,documento,nomesequence,lastupdate,tenant
FROM   financasmigration.sequenceslancamentos;

--financas.sequencialcarteira

INSERT INTO financas.sequencialcarteira
            (banco,sequencial,lastupdate,carteira,sequencialcarteira,tenant)
SELECT banco,sequencial,lastupdate,carteira,sequencialcarteira,tenant
FROM   financasmigration.sequencialcarteira;

--financas.servicosbancos

INSERT INTO financas.servicosbancosservicosns
            (id_servicons,id_servicobanco,lastupdate,tenant)
SELECT id_servicons,id_servicobanco,lastupdate,tenant
FROM   financasmigration.servicosbancosservicosns;

--financas.servicosns

INSERT INTO financas.servicosns
            (id,codigo,descricao,disponivel,lastupdate,tenant)
SELECT id,codigo,descricao,disponivel,lastupdate,tenant
FROM   financasmigration.servicosns;

--financas.taloescheques

INSERT INTO financas.taloescheques
            (talaocheque,conta,numerotalao,numerochequeinicial,numerochequefinal
             ,ativo,
             lastupdate,tenant)
SELECT talaocheque,conta,numerotalao,numerochequeinicial,numerochequefinal,ativo
       ,
       lastupdate,tenant
FROM   financasmigration.taloescheques;

--financas.terceirizacaocobrancas

INSERT INTO financas.terceirizacaocobrancas
            (terceirizacaocobranca,codigo,data,id_estabelecimento,id_fornecedor,
             percentualtaxacobrancaterceirizacao,valortotal,lastupdate,tenant)
SELECT terceirizacaocobranca,codigo,data,id_estabelecimento,id_fornecedor,
       percentualtaxacobrancaterceirizacao,valortotal,lastupdate,tenant
FROM   financasmigration.terceirizacaocobrancas;

--financas.terceirizacaocobrancasitens

INSERT INTO financas.terceirizacaocobrancasitens
            (terceirizacaocobrancaitem,id_terceirizacaocobranca,id_tituloreceber
             ,
             id_tituloreceberadiantamento,lastupdate,tenant)
SELECT terceirizacaocobrancaitem,id_terceirizacaocobranca,id_tituloreceber,
       id_tituloreceberadiantamento,lastupdate,tenant
FROM   financasmigration.terceirizacaocobrancasitens;

--financas.tipos_despesas_receitas

INSERT INTO financas.tipos_despesas_receitas
            (tipodespesareceita,codigo,descricao,tipo,lastupdate,tenant)
SELECT tipodespesareceita,codigo,descricao,tipo,lastupdate,tenant
FROM   financasmigration.tipos_despesas_receitas;

--financas.tiposcontaspagamentosbancos

INSERT INTO financas.tiposcontaspagamentosbancos
            (id,id_banco,codigo,descricao,disponivel,id_tipocontapagamentons,
             tipolayoutpagamento,lastupdate,tenant)
SELECT id,id_banco,codigo,descricao,disponivel,id_tipocontapagamentons,
       tipolayoutpagamento,lastupdate,tenant
FROM   financasmigration.tiposcontaspagamentosbancos;

--financas.tiposcontaspagamentosbancosformaspagbanco

INSERT INTO financas.tiposcontaspagamentosbancosformaspagbanco
            (id_formapagamentobanco,id_tipocontapagamentobanco,lastupdate,tenant
)
SELECT id_formapagamentobanco,id_tipocontapagamentobanco,lastupdate,tenant
FROM   financasmigration.tiposcontaspagamentosbancosformaspagbanco;

--financas.tiposcontaspagamentosns

INSERT INTO financas.tiposcontaspagamentosns
            (id,codigo,descricao,disponivel,lastupdate,tenant)
SELECT id,codigo,descricao,disponivel,lastupdate,tenant
FROM   financasmigration.tiposcontaspagamentosns;

--financas.tituloscancelados

INSERT INTO financas.tituloscancelados
            (sinal,origem,numero,emissao,vencimento,situacao,parcela,
             totalparcelas,tppessoa,
             observacao,valor,valorbruto,irretido,cofinsretido,pisretido,
             csllretido,inssretido,issretido,desconto,juros,multa,taxabancaria,
             despesasbancarias,anotacao,id,id_docfis,id_estabelecimento,
             id_pessoa,id_darf,id_gnre,id_gps,id_icmsiss,id_outdoc,
             previsaovencimento,percentualdesconto,datalimitedesconto,
             percentualmulta,datainiciomulta,percentualjurosdiario,
             codigocontabil,parcelapedidovenda,nossonumero,linhadigitavel,
             codigobarras,conta,previsaoreceber,aliquotapis,aliquotacofins,
             aliquotacsll,aliquotair,layoutcobranca,documentorateado,rps,
             situacaotexto,origemtexto,emissaotexto,vencimentotexto,
             valorbrutotexto,emissaoanomes,emissaodia,vencimentoanomes,
             vencimentodia,formapagamento,vezescartao,valortarifacartao,
             autorizacaocartao,formapagamentotexto,documentocartao,
             numeroparcelacartao,aliquotaiss,pedidovenda,informacaocartao,
             valorparcelacartao,previsaopagar,numeronota,tipopagamento,
             layoutpagamento,dataagendamento,modelodocumentofiscal,
             seriedocumentofiscal,subseriedocumentofiscal,tipocontabilizacao,
             identificadorbancario,finalidadedocbradesco,tipodecontabradesco,
             id_rps,previsaovencimentotexto,id_pedido,id_fatura,id_servicobanco,
             id_formapagamentobanco,id_finalidadepagamentobanco,
             id_tipocontapagamentobanco,id_servicons,id_formapagamentons,
             id_finalidadepagamentons,id_tipocontapagamentons,id_bempatrimonial,
             codigodocedenteboleto,numerodocumentoboleto,especieboleto,
             aceiteboleto,dataprocessamentoboleto,usobancoboleto,carteiraboleto,
             datacompetenciatributos,codigodareceitatributos,
             numerodereferenciadarf,outrosacrescimos,percentualoutrosacrescimos,
             modoexibicaomulta,modoexibicaojuros,modoexibicaooutros,
             modoexibicaocodigobarras,valorreceitabrutaacumuladadarfsimples,
             percreceitabrutaacumuladadarfsimples,numerodeclaracaogare,
             numeroetiquetagare,numerodaparcelagare,codigorenavam,
             unidadefederacaoipva,codigomunicipioipva,placaveiculoipva,
             opcaodepagamentoipva,opcaoretiradacrlv,identificadorfgts,
             lacreconectividadesocial,numerodocumentodarj,dataprovisoria,
             valorprovisorio,adiantamento,saldoadiantamento,debitoautomatico,
             irretidonf,inssretidonf,id_contrato,modoexibicaodesconto,
             id_dfparcela,id_formapagamento,id_fatura_mercadoria,
             id_renegociacao_geradora,id_renegociacao_gerada,
             id_renegociacao_baixa,usadiscriminacao,wkf_estado,wkf_data,
             valorvariacaocambialativa,valorvariacaocambialpassiva,emprestimo,
             id_contaemprestimo,id_conjunto_anexo,numerodocumento,
             datacompetencia,usuarioresponsavel,chavepersona,tipoordempagamento,
             id_template,id_usuario_cadastro,datahoracriacao,
             dataautorizacaocartao,id_prestacaodeconta,titulocoberturaconta,
             coberturaconta,documentorateadocobertura,id_documento_associado,
             contafornecedor,previsto,pagamento,parcelapagamento,contabilizado,
             importacao_hash,cfop_codigo,id_titulovinculo_previsao,
             id_previsao_vinculada,id_cfop,id_proposta,tipocredito,
             dataregularizacao,creditoidentificado,lancamentocontatc_id,
             enviadoremessacobranca,contabilizar,contabilizar_baixa,
             outrasretencoes,descricaooutrasretencoes,razaosocialfactoring,
             numerodocumentofactoring,razaosocialgps,numerodocumentogps,
             numeroexterno,id_renegociacaocontrato,estorno,id_titulo_estorno,
             tipoestorno,pisestornado,cofinsestornado,csllestornado,irestornado,
             inssestornado,issestornado,vencimentoalteradoregra,notafutura,
             id_transacaofinanceira,id_contratofinanceiro,id_baixaorigem_dimob,
             valoraserreembolsado,id_pessoa_reembolso,statusestorno,
             usamoedaestrangeira,moedaestrangeira,cotacao,
             valornamoedaestrangeira,dataultimopagamento,saldosemjurosdescontos,
             saldoadiantamentosresgatados,mesanocompetenciagps,
             outrasentidadesgps,id_titulo_origemcomissao,datacancelamento,
             id_tipo_despesa_receita,origemintegracao,origemintegracaodescricao,
             lastupdate,tenant)
SELECT sinal,origem,numero,emissao,vencimento,situacao,parcela,totalparcelas,
       tppessoa,
       observacao,valor,valorbruto,irretido,cofinsretido,pisretido,csllretido,
       inssretido,issretido,desconto,juros,multa,taxabancaria,despesasbancarias,
       anotacao,id,id_docfis,id_estabelecimento,id_pessoa,id_darf,id_gnre,id_gps
       ,id_icmsiss,id_outdoc,previsaovencimento,percentualdesconto,
       datalimitedesconto,percentualmulta,datainiciomulta,percentualjurosdiario,
       codigocontabil,parcelapedidovenda,nossonumero,linhadigitavel,codigobarras
       ,conta,previsaoreceber,aliquotapis,aliquotacofins,aliquotacsll,aliquotair
       ,layoutcobranca,documentorateado,rps,situacaotexto,origemtexto,
       emissaotexto,vencimentotexto,valorbrutotexto,emissaoanomes,emissaodia,
       vencimentoanomes,vencimentodia,formapagamento,vezescartao,
       valortarifacartao,autorizacaocartao,formapagamentotexto,documentocartao,
       numeroparcelacartao,aliquotaiss,pedidovenda,informacaocartao,
       valorparcelacartao,previsaopagar,numeronota,tipopagamento,layoutpagamento
       ,dataagendamento,modelodocumentofiscal,seriedocumentofiscal,
       subseriedocumentofiscal,tipocontabilizacao,identificadorbancario,
       finalidadedocbradesco,tipodecontabradesco,id_rps,previsaovencimentotexto,
       id_pedido,id_fatura,id_servicobanco,id_formapagamentobanco,
       id_finalidadepagamentobanco,id_tipocontapagamentobanco,id_servicons,
       id_formapagamentons,id_finalidadepagamentons,id_tipocontapagamentons,
       id_bempatrimonial,codigodocedenteboleto,numerodocumentoboleto,
       especieboleto,aceiteboleto,dataprocessamentoboleto,usobancoboleto,
       carteiraboleto,datacompetenciatributos,codigodareceitatributos,
       numerodereferenciadarf,outrosacrescimos,percentualoutrosacrescimos,
       modoexibicaomulta,modoexibicaojuros,modoexibicaooutros,
       modoexibicaocodigobarras,valorreceitabrutaacumuladadarfsimples,
       percreceitabrutaacumuladadarfsimples,numerodeclaracaogare,
       numeroetiquetagare,numerodaparcelagare,codigorenavam,unidadefederacaoipva
       ,codigomunicipioipva,placaveiculoipva,opcaodepagamentoipva,
       opcaoretiradacrlv,identificadorfgts,lacreconectividadesocial,
       numerodocumentodarj,dataprovisoria,valorprovisorio,adiantamento,
       saldoadiantamento,debitoautomatico,irretidonf,inssretidonf,id_contrato,
       modoexibicaodesconto,id_dfparcela,id_formapagamento,id_fatura_mercadoria,
       id_renegociacao_geradora,id_renegociacao_gerada,id_renegociacao_baixa,
       usadiscriminacao,wkf_estado,wkf_data,valorvariacaocambialativa,
       valorvariacaocambialpassiva,emprestimo,id_contaemprestimo,
       id_conjunto_anexo,numerodocumento,datacompetencia,usuarioresponsavel,
       chavepersona,tipoordempagamento,id_template,id_usuario_cadastro,
       datahoracriacao,dataautorizacaocartao,id_prestacaodeconta,
       titulocoberturaconta,coberturaconta,documentorateadocobertura,
       id_documento_associado,contafornecedor,previsto,pagamento,
       parcelapagamento,contabilizado,importacao_hash,cfop_codigo,
       id_titulovinculo_previsao,id_previsao_vinculada,id_cfop,id_proposta,
       tipocredito,dataregularizacao,creditoidentificado,lancamentocontatc_id,
       enviadoremessacobranca,contabilizar,contabilizar_baixa,outrasretencoes,
       descricaooutrasretencoes,razaosocialfactoring,numerodocumentofactoring,
       razaosocialgps,numerodocumentogps,numeroexterno,id_renegociacaocontrato,
       estorno,id_titulo_estorno,tipoestorno,pisestornado,cofinsestornado,
       csllestornado,irestornado,inssestornado,issestornado,
       vencimentoalteradoregra,notafutura,id_transacaofinanceira,
       id_contratofinanceiro,id_baixaorigem_dimob,valoraserreembolsado,
       id_pessoa_reembolso,statusestorno,usamoedaestrangeira,moedaestrangeira,
       cotacao,valornamoedaestrangeira,dataultimopagamento,
       saldosemjurosdescontos,saldoadiantamentosresgatados,mesanocompetenciagps,
       outrasentidadesgps,id_titulo_origemcomissao,datacancelamento,
       id_tipo_despesa_receita,origemintegracao,origemintegracaodescricao,
       lastupdate,tenant
FROM   financasmigration.tituloscancelados;

--financas.titulospagarapuradosporguia

INSERT INTO financas.titulospagarapuradosporguia
            (titulopagarapuradoporguia,titulopagarapurado,titulopagargeradoguia,
             id_guia_darf,
             id_guia_inss,id_guia_iss,tipoimposto,mes_competencia,
             ano_competencia,lastupdate,tenant)
SELECT titulopagarapuradoporguia,titulopagarapurado,titulopagargeradoguia,
       id_guia_darf,
       id_guia_inss,id_guia_iss,tipoimposto,mes_competencia,ano_competencia,
       lastupdate,tenant
FROM   financasmigration.titulospagarapuradosporguia;

--financas.titulosreceberestornoscartoes

INSERT INTO financas.titulosreceberestornoscartoes
            (lancamentoconta,tituloreceber,tituloreceberestornocartao,lastupdate
             ,tenant)
SELECT lancamentoconta,tituloreceber,tituloreceberestornocartao,lastupdate,
       tenant
FROM   financasmigration.titulosreceberestornoscartoes;

--financas.titulosreceberporvendedores

INSERT INTO financas.titulosreceberporvendedores
            (percentualparticipacao,versao,tituloreceber,
             tituloreceberporvendedor,
             participante,percentualcomissao,valorcomissao,lastupdate,tenant)
SELECT percentualparticipacao,versao,tituloreceber,tituloreceberporvendedor,
       participante,percentualcomissao,valorcomissao,lastupdate,tenant
FROM   financasmigration.titulosreceberporvendedores;

--financas.transferenciasinvestimentos

INSERT INTO financas.transferenciasinvestimentos
            (transferenciainvestimento,lanctoinvestoriginal,
             lanctoinvesttransferencia,
             lastupdate,tenant)
SELECT transferenciainvestimento,lanctoinvestoriginal,lanctoinvesttransferencia,
       lastupdate,tenant
FROM   financasmigration.transferenciasinvestimentos;

--financas.valoresindices

INSERT INTO financas.valoresindices
            (valorindice,indice,mes,ano,valor,lastupdate,tenant)
SELECT valorindice,indice,mes,ano,valor,lastupdate,tenant
FROM   financasmigration.valoresindices;

--financas.valoresindicesdiarios

INSERT INTO financas.valoresindicesdiarios
            (valorindicediario,indicediario,data,valor,lastupdate,tenant)
SELECT valorindicediario,indicediario,data,valor,lastupdate,tenant
FROM   financasmigration.valoresindicesdiarios;

--financas.valoresitensvariaveis

INSERT INTO financas.valoresitensvariaveis
            (valoritemvariavel,itemcontrato,dia,semana,mes,ano,valor,
             processamentocontrato,
             valorinformado,observacao,lastupdate,tenant)
SELECT valoritemvariavel,itemcontrato,dia,semana,mes,ano,valor,
       processamentocontrato,
       valorinformado,observacao,lastupdate,tenant
FROM   financasmigration.valoresitensvariaveis;

--financas.vinculosestabelecimentos

INSERT INTO financas.vinculosestabelecimentos
            (vinculoestabelecimento,estabelecimentoorigem,
             estabelecimentovinculado,
             compoepatrimonio,lastupdate,tenant)
SELECT vinculoestabelecimento,estabelecimentoorigem,estabelecimentovinculado,
       compoepatrimonio,lastupdate,tenant
FROM   financasmigration.vinculosestabelecimentos;

--financas.vinculosgruposempresariais

INSERT INTO financas.vinculosgruposempresariais
            (vinculogrupoempresarial,grupoempresarialorigem,
             grupoempresarialvinculado,
             lastupdate,tenant)
SELECT vinculogrupoempresarial,grupoempresarialorigem,grupoempresarialvinculado,
       lastupdate,tenant
FROM   financasmigration.vinculosgruposempresariais;

--ns.conjuntosclassificacoesparticipantes

INSERT INTO ns.conjuntosclassificacoesparticipantes
            (conjuntoclassificacaoparticipante,registro,conjunto,lastupdate,
             tenant)
SELECT conjuntoclassificacaoparticipante,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosclassificacoesparticipantes;

--ns.conjuntosclientes

INSERT INTO ns.conjuntosclientes
            (conjuntocliente,registro,conjunto,lastupdate,tenant)
SELECT conjuntocliente,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosclientes;

--ns.conjuntosfichas

INSERT INTO ns.conjuntosfichas
            (conjuntoficha,registro,conjunto,lastupdate,tenant)
SELECT conjuntoficha,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosfichas;

--ns.conjuntosfornecedores

INSERT INTO ns.conjuntosfornecedores
            (conjuntofornecedor,registro,conjunto,lastupdate,tenant)
SELECT conjuntofornecedor,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosfornecedores;

--ns.conjuntosmodeloscontratos

INSERT INTO ns.conjuntosmodeloscontratos
            (conjuntomodelocontrato,registro,conjunto,lastupdate,tenant)
SELECT conjuntomodelocontrato,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosmodeloscontratos;

--ns.conjuntosrepresentantescomerciais

INSERT INTO ns.conjuntosrepresentantescomerciais
            (conjuntorepresentantecomercial,registro,conjunto,lastupdate,tenant)
SELECT conjuntorepresentantecomercial,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosrepresentantescomerciais;

--ns.conjuntosrepresentantestecnicos

INSERT INTO ns.conjuntosrepresentantestecnicos
            (conjuntorepresentantetecnico,registro,conjunto,lastupdate,tenant)
SELECT conjuntorepresentantetecnico,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosrepresentantestecnicos;

--ns.conjuntosservicos

INSERT INTO ns.conjuntosservicos
            (conjuntoservico,registro,conjunto,lastupdate,tenant)
SELECT conjuntoservico,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosservicos;

--ns.conjuntosservicosdecatalogos

INSERT INTO ns.conjuntosservicosdecatalogos
            (conjuntoservicodecatalogo,registro,conjunto,lastupdate,tenant)
SELECT conjuntoservicodecatalogo,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosservicosdecatalogos;

--ns.conjuntostecnicos

INSERT INTO ns.conjuntostecnicos
            (conjuntotecnico,registro,conjunto,lastupdate,tenant)
SELECT conjuntotecnico,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntostecnicos;

--ns.conjuntostransportadoras

INSERT INTO ns.conjuntostransportadoras
            (conjuntotransportador,registro,conjunto,lastupdate,tenant)
SELECT conjuntotransportador,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntostransportadoras;

--ns.conjuntosvendedores

INSERT INTO ns.conjuntosvendedores
            (conjuntovendedor,registro,conjunto,lastupdate,tenant)
SELECT conjuntovendedor,registro,conjunto,lastupdate,tenant
FROM   nsmigration.conjuntosvendedores;