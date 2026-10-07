##few Lines of data cleaning
retention_df = df.filter(f.col("status")=="Complete")
retention_df = retention_df.drop("returned_at", "gender")

orders_df = orders_df.drop("inventory_item_id", "created_at", "shipped_at","delivered_at", "returned_at", "user_id", "id")

retention_df = retention_df.join(orders_df, on="order_id", how="right")

dr = dr.withColumnRenamed("id", "product_id")
product_df = dr.drop("cost","category", "name", "brand", "department", "sku", "distribution_center_id")
product_df = product_df.withColumn("retail_price" , f.round("retail_price", 2))

retention_df = retention_df.join(product_df, on="product_id", how="right")
retention_df = retention_df.filter( f.col("order_id").isNotNull())
retention_df = retention_df.withColumn("amount", f.col("num_of_item")*f.col("retail_price"))


rfm_df = dr.groupBy("user_id").agg( f.datediff(f.lit(refer_date), f.col("created_at")).alias("Recency"), f.count("order_id").alias("Frequency"), 
f.sum("amount").alias("Monetary")) 
