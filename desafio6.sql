SELECT 
	ROUND(MIN(plans.plan_price), 2) AS faturamento_minimo,
  ROUND(MAX(plans.plan_price), 2) AS faturamento_maximo,
  ROUND(AVG(plans.plan_price), 2) AS faturamento_medio,
  ROUND(SUM(plans.plan_price), 2) AS faturamento_total
FROM SpotifyClone.plans
INNER JOIN SpotifyClone.user ON plans.plan_id = user.plan_id;
