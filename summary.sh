#!/bin/bash

# alpログ解析結果を出力
# 素のalp出力
sudo cat /var/log/nginx/access.log | alp ltsv > /tmp/alp.txt
# 正規表現でグルーピングしたalp出力
# 合計降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/recommended_estate/.*,/api/estate/search/condition,/api/estate/nazotte,/api/estate/req_doc/.*,/api/estate/low_priced,/api/estate/search,/api/estate,/api/estate/.*,/api/chair/buy/.*,/api/chair/search/condition,/api/chair/low_priced,/api/chair/search,/api/chair,/api/chair/.*' --sort sum -r > /tmp/alp-grouped-sum.txt
# 平均降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/recommended_estate/.*,/api/estate/search/condition,/api/estate/nazotte,/api/estate/req_doc/.*,/api/estate/low_priced,/api/estate/search,/api/estate,/api/estate/.*,/api/chair/buy/.*,/api/chair/search/condition,/api/chair/low_priced,/api/chair/search,/api/chair,/api/chair/.*' --sort avg -r > /tmp/alp-grouped-avg.txt

# スロークエリ解析結果を出力
sudo pt-query-digest /var/log/mysql/mysql-slow.log > /tmp/pt-query-digest.txt
