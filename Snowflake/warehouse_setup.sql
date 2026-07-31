
CREATE warehouse Looker;

CREATE database retention_analysis;

CREATE OR REPLACE SCHEMA retention_analysis.gold_layer;

CREATE OR REPLACE STAGE retention_analysis.gold_layer.s3_gold_stage
  URL = 's3://looker-gold/'
  CREDENTIALS = (AWS_KEY_ID = 'A*******' AWS_SECRET_KEY = 'T******');
  
