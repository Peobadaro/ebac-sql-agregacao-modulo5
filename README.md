# EBAC – Exercício Módulo 5 (SQL / Agregação)

Agregações sobre as tabelas **product** e **stock** no PostgreSQL.

## As duas agregações do exercício

1. **Quantidade de itens de cada produto:** `SUM(s.quantity)` com `GROUP BY p.sku, p.name`. Todas as colunas não agregadas do `SELECT` estão no `GROUP BY`.
2. **Total de itens em estoque:** `SELECT SUM(quantity) FROM stock`.

Extras com o resto do módulo: `COUNT(DISTINCT)`, `AVG`, `HAVING`, `DISTINCT`, `ORDER BY` e `LIMIT/OFFSET`.

## Arquivos

| Arquivo | O que faz |
|---|---|
| `create_tables.sql` | Cria as tabelas (Módulo 2) |
| `insert_data.sql` | Insere os dados (Módulo 3) |
| `alter_relationship.sql` | Relacionamento 1:N product × stock (Módulo 4) |
| `aggregations.sql` | **Exercício deste módulo** |
| `resultado.txt` | Saída da execução das consultas |

## Como rodar

```bash
psql -U postgres -d nome_do_banco -f create_tables.sql
psql -U postgres -d nome_do_banco -f insert_data.sql
psql -U postgres -d nome_do_banco -f alter_relationship.sql
psql -U postgres -d nome_do_banco -f aggregations.sql
```
