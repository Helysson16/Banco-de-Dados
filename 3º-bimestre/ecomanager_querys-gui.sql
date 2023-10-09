#Os 3 principais consumos do usuário:
SELECT mês, SUM(consumo) AS consumo_total
FROM tabela_de_consumo
WHERE usuário_id = 'ID_DO_USUÁRIO'
GROUP BY mês
ORDER BY consumo_total DESC;

#Em quais meses o usuário ultrapassou a meta:
SELECT DISTINCT mês
FROM tabela_de_consumo
WHERE usuário_id = 'ID_DO_USUÁRIO' AND consumo > meta;

#Quantos Kw foram economizados no ano atual:
SELECT SUM(consumo) AS economia_kw
FROM tabela_de_consumo
WHERE usuário_id = 'ID_DO_USUÁRIO' AND YEAR(data) = YEAR(NOW()) - 1;

#Em média, como está a relação do usuário com suas metas nos últimos 3 meses:
SELECT AVG(consumo - meta) AS média_diferença
FROM tabela_de_consumo
WHERE usuário_id = 'ID_DO_USUÁRIO';

#Considerando o histórico total do usuário, qual seria uma meta sugerida para ele:

SELECT AVG(consumo) AS média_consumo
FROM tabela_de_consumo
WHERE usuário_id = 'ID_DO_USUÁRIO';