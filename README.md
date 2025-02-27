# 📊 Delivery Agent Performance Dashboard - Power BI  

## 📌 Overview  
This project is a **Power BI Dashboard** analyzing **delivery agent performance** based on customer feedback, order trends, and delivery efficiency. The dashboard provides key insights into **customer satisfaction, agent performance, and delivery times**.

## 📸 Dashboard Screenshot  
Dashboard(![dashboard (2)](https://github.com/user-attachments/assets/f8a96828-a42d-403f-85b2-3c87a8ebbeb4)
  

---

## 📊 **Key Insights**
- **Positive Feedback Rate:** **33.0%**  
- **Negative Feedback Rate:** **34.5%**  
- **Average Rating:** **3.00**  
- **Fastest Delivery Time:** **10 min**  
- **Slowest Delivery Time:** **60 min**  
- **Orders Distribution:** Categorized into **Electronics, Food, Essentials, Grocery, Pharmacy**  
- **Delivery Time vs. Rating:** Faster deliveries tend to have **higher customer ratings**.  

---

## 🛠 **Technologies Used**
- **Power BI** (Data Visualization)  
- **PostgreSQL** (Database & SQL Queries)  
- **SQL Queries & DAX Measures** (Data Processing & KPI Calculation)  

---

## 📌 **SQL Queries Used**
### **Customer Feedback Distribution**
```sql
SELECT agent_name, location,
       COUNT(*) AS total_feedback,
       SUM(CASE WHEN customer_feedback_type = 'Positive' THEN 1 ELSE 0 END) AS positive_feedback,
       SUM(CASE WHEN customer_feedback_type = 'Neutral' THEN 1 ELSE 0 END) AS neutral_feedback,
       SUM(CASE WHEN customer_feedback_type = 'Negative' THEN 1 ELSE 0 END) AS negative_feedback
FROM delivery_agent_reviews
WHERE customer_feedback_type IN ('Positive', 'Neutral','Negative')
GROUP BY agent_name, location
ORDER BY location;
```

### **Average Rating per Agent**
```sql
SELECT agent_name, ROUND(AVG(rating), 1) AS average_rating
FROM delivery_agent_reviews
GROUP BY agent_name;
```

### **Order Count by Agent**
```sql
SELECT agent_name, COUNT(*) AS order_count
FROM delivery_agent_reviews
GROUP BY agent_name
ORDER BY order_count DESC;
```

### **Order Count by Category**
```sql
SELECT order_type, COUNT(*) AS order_count
FROM delivery_agent_reviews
GROUP BY order_type
ORDER BY order_count DESC;
```

### **Delivery Time Analysis**
```sql
SELECT MIN(delivery_time) AS fastest_delivery, MAX(delivery_time) AS slowest_delivery
FROM delivery_agent_reviews;
```

## 📌 **DAX Measures Used**
### **Positive Feedback Rate**
```
% of Positive = 
DIVIDE(
    CALCULATE(COUNT('Fast Delivery Agent Reviews'[Customer Feedback Type]), 
    'Fast Delivery Agent Reviews'[Customer Feedback Type] = "Positive"),
    CALCULATE(COUNT('Fast Delivery Agent Reviews'[Customer Feedback Type]))
)
```

### **Negative Feedback Rate**
```
% of Negative = 
DIVIDE(
    CALCULATE(COUNT('Fast Delivery Agent Reviews'[Customer Feedback Type]), 
    'Fast Delivery Agent Reviews'[Customer Feedback Type] = "Negative"),
    CALCULATE(COUNT('Fast Delivery Agent Reviews'[Customer Feedback Type]))
)

```

## 📌 Dashboard Features

### ✅ KPIs
- **Positive Feedback Rate**
- **Negative Feedback Rate**
- **Average Rating**
- **Fastest Delivery Time**
- **Slowest Delivery Time**

### 📈 Charts Used
- **📊 Bar Chart:** Customer feedback distribution by agent
- **📉 Line Chart:** Delivery time vs. average rating
- **🥧 Pie Chart:** Order distribution by category
- **📊 Bar Chart:** Order count by agent

### 🎛 Filters Available
- **Agent Name**
- **Location**
- **Categories**
- **Order Accuracy**
- **Price Range**
 





