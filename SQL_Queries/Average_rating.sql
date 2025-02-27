SELECT agent_name, (AVG(rating)) AS avg_rating
FROM delivery_agent_reviews
GROUP BY agent_name;