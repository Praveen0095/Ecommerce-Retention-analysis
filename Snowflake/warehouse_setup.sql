-- ======================================================
-- Create Warehouse
-- ======================================================
CREATE warehouse Looker;
-- ======================================================
-- Create Database
-- ======================================================
CREATE database retention_analysis;
-- ======================================================
-- Create Schema
-- ======================================================
CREATE OR REPLACE SCHEMA retention_analysis.gold_layer;
-- ======================================================
-- Create Stage
-- ======================================================
CREATE OR REPLACE STAGE retention_analysis.gold_layer.s3_gold_stage
  URL = 's3://looker-gold/'
  CREDENTIALS = (AWS_KEY_ID = 'A*******' AWS_SECRET_KEY = 'T******');
  
