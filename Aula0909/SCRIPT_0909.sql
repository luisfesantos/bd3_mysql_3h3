use empregados_luis;
/* Select simples */
select * from empregado;

/* Select com filtro */
select cod_emp from empregado where civil like 'V';

/* Select com filtro por atributo da tabela estrangeira com uso de SubQuery*/
select * from dependente where cod_emp in(
	select cod_emp from empregado where civil like 'V'
);

/* Desafio quero os dependetes dos funcionarios com mais de 5 anos de empresa */
select FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0) AS tempEmpresa from empregado where tempEmpresa > 5;
select * from dependente where cod_emp in(
	select cod_emp from empregado where FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0)  > 5
);

/* Desafio quero os dependetes dos funcionarios com mais de 40 anos de idade */
select * from dependente where cod_emp in(
	select cod_emp from empregado where FORMAT((DATEDIFF(NOW(), dt_nascimento) / 365), 0)  > 40
);