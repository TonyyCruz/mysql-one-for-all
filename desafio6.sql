SELECT MIN(plan.plan_value) AS faturamento_minimo,
MAX(plan.plan_value) AS faturamento_maximo,
ROUND(SUM(plan.plan_value) / COUNT(u.user_id), 2) AS faturamento_medio,
ROUND(SUM(plan.plan_value), 2) AS faturamento_total
FROM plans AS plan
INNER JOIN users AS u ON plan.plan_id = u.plan_id
;