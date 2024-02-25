# Categorização e Encoding

SELECT * FROM db.TB_DADOS;
SELECT COUNT(*) FROM db.TB_DADOS;

# Binarização da variável classe (0/1)
SELECT DISTINCT classe FROM db.TB_DADOS;

SELECT
	CASE
		WHEN classe = 'no-recurrence-events' THEN 0
        WHEN classe = 'recurrence-events' THEN 1
	END as classe
FROM db.TB_DADOS;

# Binarização da variável irradiando (0/1)
SELECT DISTINCT irradiando FROM db.TB_DADOS;

SELECT
	CASE
		WHEN irradiando = 'no' THEN 0
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM db.TB_DADOS;

# Label encoding da variável node_caps
SELECT DISTINCT node_caps FROM db.TB_DADOS;

SELECT 
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps
FROM db.TB_DADOS;

# Categorização da variável seio (E/D)
SELECT DISTINCT seio FROM db.TB_DADOS;

SELECT 
	CASE 
		WHEN seio = 'left' THEN 'E'
        WHEN seio = 'right' THEN 'D'
	END as seio
FROM db.TB_DADOS;

# Categorização da variável tamanho_tumor (6 Categorias)
SELECT DISTINCT tamanho_tumor FROM db.TB_DADOS;

SELECT 
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' THEN 'Tratamento Urgente'
	END as tamanho_tumor
FROM db.TB_DADOS;

# Label Encoding da variável quadrante (1,2,3,4,5)
SELECT DISTINCT quadrante FROM db.TB_DADOS;

SELECT 
    CASE
        WHEN quadrante = 'left_up' THEN 1
        WHEN quadrante = 'right_up' THEN 2
        WHEN quadrante = 'left_low' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
    END AS quadrante
FROM db.TB_DADOS;

# Query com todas as transformações
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
	idade,
	menopausa,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' THEN 'Tratamento Urgente'
	END as tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN seio = 'left' THEN 'E' 
        WHEN seio = 'right' THEN 'D'
	END as seio,
	CASE 
		WHEN quadrante = 'left_up' THEN 1
        WHEN quadrante = 'right_up' THEN 2
        WHEN quadrante = 'left_low' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0 
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM db.TB_DADOS;

# Cria uma nova tabela
CREATE TABLE db.TB_DADOS2
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
	idade,
	menopausa,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' THEN 'Tratamento Urgente'
	END as tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN seio = 'left' THEN 'E' 
        WHEN seio = 'right' THEN 'D'
	END as seio,
	CASE 
		WHEN quadrante = 'left_up' THEN 1
        WHEN quadrante = 'right_up' THEN 2
        WHEN quadrante = 'left_low' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0 
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM db.TB_DADOS;

SELECT COUNT(*) FROM db.TB_DADOS2;

