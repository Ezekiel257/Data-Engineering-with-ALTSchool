"""
author: oyekanmiakande@gmail.com
"""

question_one = """
SELECT txn_type , count(txn_id) AS "transaction_count"
FROM  raw.transactions t
WHERE ticker = 'BTC'
GROUP BY txn_type;
"""


question_two = """
SELECT 
		EXTRACT(YEAR FROM txn_date::date) AS txn_year, 
		txn_type, 
		count(txn_id) AS "txn_count",  
		sum(quantity) AS total_quantity, 
		avg(quantity) AS average_quantity 
FROM raw.transactions
WHERE  ticker = 'BTC'
GROUP BY txn_type, txn_year;
"""


question_three = """
SELECT 
		EXTRACT(MONTH FROM txn_date::date) AS calendar_month,
		sum(CASE WHEN txn_type = 'BUY' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS buy_quantity,
    	sum(CASE WHEN txn_type = 'SELL' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS sell_quantity
FROM raw.transactions t 
WHERE ticker = 'ETH' AND EXTRACT(YEAR FROM txn_date::date) = 2020
GROUP BY calendar_month;
"""


question_four = """
SELECT m.first_name , sum(t.quantity) AS total_quantity
FROM raw.members m 
INNER JOIN raw.transactions t ON m.member_id = t.member_id
WHERE ticker = 'BTC'
GROUP BY m.first_name
ORDER BY total_quantity DESC
LIMIT 3;
"""