-- Consulta 1
SELECT
    c.id_consulta,
    p.nome AS paciente,
    f.nome AS dentista,
    c.data,
    c.hora,
    c.sala
FROM consulta c
JOIN paciente p 
    ON c.cpf_paciente = p.cpf_paciente
JOIN dentista d 
    ON c.id_dentista = d.id_dentista
JOIN funcionario f 
    ON d.id_funcionario = f.id_funcionario
WHERE c.sala > 1
ORDER BY c.data ASC, c.hora ASC;



-- Consulta 2
SELECT
    p.nome AS paciente,
    COUNT(c.id_consulta) AS total_consultas,
    SUM(t.valor) AS valor_total
FROM paciente p
JOIN consulta c 
    ON p.cpf_paciente = c.cpf_paciente
JOIN tratamento t 
    ON c.id_tratamento = t.id_tratamento
GROUP BY p.nome
ORDER BY valor_total DESC;



-- Consulta 3
SELECT
    f.nome AS dentista,
    COUNT(c.id_consulta) AS total_consultas,
    SUM(t.valor) AS valor_total_tratamentos
FROM consulta c
JOIN dentista d 
    ON c.id_dentista = d.id_dentista
JOIN funcionario f 
    ON d.id_funcionario = f.id_funcionario
JOIN tratamento t 
    ON c.id_tratamento = t.id_tratamento
GROUP BY f.nome
HAVING SUM(t.valor) > (
    SELECT AVG(total_valor)
    FROM (
        SELECT
            SUM(t2.valor) AS total_valor
        FROM consulta c2
        JOIN tratamento t2
            ON c2.id_tratamento = t2.id_tratamento
        GROUP BY c2.id_dentista
    ) subconsulta
)
ORDER BY valor_total_tratamentos DESC;