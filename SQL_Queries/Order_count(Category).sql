SELECT order_type, COUNT(*) 
FROM delivery_agent_reviews
GROUP BY order_type