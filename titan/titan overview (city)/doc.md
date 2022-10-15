# **A. titan overview - city level**
all documentation about TNPS cardinality overview dashboard ```updated Oct 14th 2022```
![Titan Overview - subs overview]([https://github.com/pzap/titan-dashboard/blob/main/Titan%20Overview%20-%20subs%20overview.png](https://github.com/pzap/dashboard-voyager/blob/main/titan/titan%20overview%20(city)/Titan%20Overview%20-%20subs%20overview.png))
1. data sources, 
2. columns, 
3. dax columns & measures
4. data model

## **A.1. data sources**
| table name         | DSN                      | source table name                | sql/mcode/dax          | method |
|--------------------|--------------------------|---------------------------|------------------------|------|
| All City | DSN_MMA_CDH_IMPALA_MMAID | sbx_titan.cei_city | select * from sbx_titan.cei_city | sql |
| nw_city_squad | DSN_MMA_CDH_IMPALA_MMAID | sbx_bca.nw_city_squad | select * from sbx_bca.nw_city_squad | sql |
| nw_dim_city | DSN_MMA_CDH_IMPALA_MMAID | sbx_bca.nw_dim_city | select * from sbx_bca.nw_dim_city | sql |
| by Parameter | - | - | let <br />Source = Table.FromRows(Json.Document<br />(Binary.Decompress<br />(Binary.FromText<br />("i45WMlTSUXJJLElUcCxL<br />zMxJTMrMySypVIrViVYyAs<br />qEpyYpOBXllxdn5qWDBY2BgsElR<br />amJuTARE5BIfnJmYo6Cb<br />2pKZiJY0BQo6A5VEwsA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [id = _t, category = _t]), <br />#"Changed Type" = Table.TransformColumnTypes (Source,{{"id", Int64.Type}, {"category", type text}}), <br />#"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"category", "Parameter"}})<br /> in <br />#"Renamed Columns" | mcode |
| All City Maxy|-|-|let<br />Source = #"All City",<br />#"Added Custom" = Table.AddColumn(Source, "max week", each [year]&[week]),<br />#"Changed Type" = Table.TransformColumnTypes(#"Added Custom",{{"max week", Int64.Type}}),<br />#"Added Custom1" = Table.AddColumn(#"Changed Type", "Custom", each List.Max(#"Changed Type"[max week])),<br />#"Filtered Rows" = Table.SelectRows(#"Added Custom1", each ([max week] = [Custom]))<br />in<br />#"Filtered Rows"|mcode|

## **A.2. columns**
______________________________________________________________________________________________________________________________________________________________________
**A.2.1. all city & all city maxy**
| column                      | type | unit |
|-----------------------------|------|------|
|	kabupaten	|	string	|		|
| kabupaten_id| whole number | |
|	operator	|	string	|		|
|	week	|	whole number	|	week in year	|
|	data_availability_detractor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_detractor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	data_availability_detractor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_detractor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_detractor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	data_availability_detractor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_detractor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_detractor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_detractor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_detractor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_detractor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_detractor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_passive_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_passive_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	data_availability_passive_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_passive_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_passive_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	data_availability_passive_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_passive_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_passive_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_passive_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_passive_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_passive_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_passive_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_promotor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_promotor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	data_availability_promotor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_promotor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	data_availability_promotor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	data_availability_promotor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	data_availability_promotor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_promotor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_promotor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_promotor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	data_availability_promotor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	data_availability_promotor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_detractor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_detractor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_detractor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_detractor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_detractor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_detractor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_detractor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_detractor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_detractor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_detractor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_detractor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_detractor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_passive_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_passive_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_passive_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_passive_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_passive_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_passive_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_passive_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_passive_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_passive_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_passive_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_passive_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_passive_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_promotor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_promotor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_promotor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_promotor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	web_browsing_promotor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	web_browsing_promotor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	web_browsing_promotor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_promotor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_promotor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	web_browsing_promotor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	web_browsing_promotor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	web_browsing_promotor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_detractor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_detractor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	streaming_detractor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	streaming_detractor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_detractor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	streaming_detractor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	streaming_detractor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_detractor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	streaming_detractor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_detractor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_detractor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	streaming_detractor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_passive_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_passive_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	streaming_passive_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	streaming_passive_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_passive_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	streaming_passive_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	streaming_passive_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_passive_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	streaming_passive_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_passive_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_passive_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	streaming_passive_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_promotor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_promotor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	streaming_promotor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	streaming_promotor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	streaming_promotor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	streaming_promotor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	streaming_promotor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_promotor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	streaming_promotor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	streaming_promotor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	streaming_promotor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	streaming_promotor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_detractor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_detractor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	social_media_detractor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	social_media_detractor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_detractor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	social_media_detractor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	social_media_detractor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_detractor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	social_media_detractor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_detractor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_detractor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	social_media_detractor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_passive_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_passive_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	social_media_passive_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	social_media_passive_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_passive_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	social_media_passive_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	social_media_passive_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_passive_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	social_media_passive_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_passive_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_passive_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	social_media_passive_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_promotor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_promotor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	social_media_promotor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	social_media_promotor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	social_media_promotor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	social_media_promotor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	social_media_promotor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_promotor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	social_media_promotor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	social_media_promotor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	social_media_promotor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	social_media_promotor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_detractor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_detractor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	gaming_detractor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	gaming_detractor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_detractor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	gaming_detractor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	gaming_detractor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_detractor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	gaming_detractor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_detractor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_detractor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	gaming_detractor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_passive_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_passive_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	gaming_passive_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	gaming_passive_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_passive_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	gaming_passive_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	gaming_passive_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_passive_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	gaming_passive_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_passive_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_passive_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	gaming_passive_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_promotor_metric_dl_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_promotor_metric_dl_rtt_mean	|	decimal number	|	ms	|
|	gaming_promotor_metric_dl_throughput_mean	|	decimal number	|	mbps	|
|	gaming_promotor_metric_ul_packets_loss_rate_mean	|	decimal number	|	percentage	|
|	gaming_promotor_metric_ul_rtt_mean	|	decimal number	|	ms	|
|	gaming_promotor_metric_ul_throughput_mean	|	decimal number	|	mbps	|
|	gaming_promotor_metric_dl_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_promotor_metric_dl_rtt_stddev	|	decimal number	|	ms	|
|	gaming_promotor_metric_dl_throughput_stddev	|	decimal number	|	mbps	|
|	gaming_promotor_metric_ul_packets_loss_rate_stddev	|	decimal number	|	percentage	|
|	gaming_promotor_metric_ul_rtt_stddev	|	decimal number	|	ms	|
|	gaming_promotor_metric_ul_throughput_stddev	|	decimal number	|	mbps	|
|	data_availability_passive_n	|	decimal number	|	# of subs	|
|	data_availability_detractor_n	|	decimal number	|	# of subs	|
|	data_availability_promotor_n	|	decimal number	|	# of subs	|
|	web_browsing_passive_n	|	decimal number	|	# of subs	|
|	web_browsing_detractor_n	|	decimal number	|	# of subs	|
|	web_browsing_promotor_n	|	decimal number	|	# of subs	|
|	streaming_passive_n	|	decimal number	|	# of subs	|
|	streaming_detractor_n	|	decimal number	|	# of subs	|
|	streaming_promotor_n	|	decimal number	|	# of subs	|
|	social_media_passive_n	|	decimal number	|	# of subs	|
|	social_media_detractor_n	|	decimal number	|	# of subs	|
|	social_media_promotor_n	|	decimal number	|	# of subs	|
|	gaming_passive_n	|	decimal number	|	# of subs	|
|	gaming_detractor_n	|	decimal number	|	# of subs	|
|	gaming_promotor_n	|	decimal number	|	# of subs	|
|	data_availability_detractor_revenue_net	|	decimal number	|	idr	|
|	data_availability_passive_revenue_net	|	decimal number	|	idr	|
|	data_availability_promotor_revenue_net	|	decimal number	|	idr	|
|	web_browsing_detractor_revenue_net	|	decimal number	|	idr	|
|	web_browsing_passive_revenue_net	|	decimal number	|	idr	|
|	web_browsing_promotor_revenue_net	|	decimal number	|	idr	|
|	streaming_detractor_revenue_net	|	decimal number	|	idr	|
|	streaming_passive_revenue_net	|	decimal number	|	idr	|
|	streaming_promotor_revenue_net	|	decimal number	|	idr	|
|	social_media_detractor_revenue_net	|	decimal number	|	idr	|
|	social_media_passive_revenue_net	|	decimal number	|	idr	|
|	social_media_promotor_revenue_net	|	decimal number	|	idr	|
|	gaming_detractor_revenue_net	|	decimal number	|	idr	|
|	gaming_passive_revenue_net	|	decimal number	|	idr	|
|	gaming_promotor_revenue_net	|	decimal number	|	idr	|
|	data_availability_detractor_u_mb	|	decimal number	|	mb	|
|	data_availability_passive_u_mb	|	decimal number	|	mb	|
|	data_availability_promotor_u_mb	|	decimal number	|	mb	|
|	web_browsing_detractor_u_mb	|	decimal number	|	mb	|
|	web_browsing_passive_u_mb	|	decimal number	|	mb	|
|	web_browsing_promotor_u_mb	|	decimal number	|	mb	|
|	streaming_detractor_u_mb	|	decimal number	|	mb	|
|	streaming_passive_u_mb	|	decimal number	|	mb	|
|	streaming_promotor_u_mb	|	decimal number	|	mb	|
|	social_media_detractor_u_mb	|	decimal number	|	mb	|
|	social_media_passive_u_mb	|	decimal number	|	mb	|
|	social_media_promotor_u_mb	|	decimal number	|	mb	|
|	gaming_detractor_u_mb	|	decimal number	|	mb	|
|	gaming_passive_u_mb	|	decimal number	|	mb	|
|	gaming_promotor_u_mb	|	decimal number	|	mb	|
|	data_availability_detractor_u_dwe	|	decimal number	|	dwe	|
|	data_availability_passive_u_dwe	|	decimal number	|	dwe	|
|	data_availability_promotor_u_dwe	|	decimal number	|	dwe	|
|	web_browsing_detractor_u_dwe	|	decimal number	|	dwe	|
|	web_browsing_passive_u_dwe	|	decimal number	|	dwe	|
|	web_browsing_promotor_u_dwe	|	decimal number	|	dwe	|
|	streaming_detractor_u_dwe	|	decimal number	|	dwe	|
|	streaming_passive_u_dwe	|	decimal number	|	dwe	|
|	streaming_promotor_u_dwe	|	decimal number	|	dwe	|
|	social_media_detractor_u_dwe	|	decimal number	|	dwe	|
|	social_media_passive_u_dwe	|	decimal number	|	dwe	|
|	social_media_promotor_u_dwe	|	decimal number	|	dwe	|
|	gaming_detractor_u_dwe	|	decimal number	|	dwe	|
|	gaming_passive_u_dwe	|	decimal number	|	dwe	|
|	gaming_promotor_u_dwe	|	decimal number	|	dwe	|
|	data_availability_final_score	|	decimal number	|	percentage	|
|	web_browsing_final_score	|	decimal number	|	percentage	|
|	streaming_final_score	|	decimal number	|	percentage	|
|	social_media_final_score	|	decimal number	|	percentage	|
|	gaming_final_score	|	decimal number	|	percentage	|

**A.2.2. nw_city_squad**
| column name                     | type | unit |
|-----------------------------|------|------|
|kabupaten_id|whole number||
|operator|string||
|	city_343	|	string	|		|
|city_strategy	|	string	|		|
|city_priority	|	string	|		|
|	city_tier	|	string	|		|

**A.2.3. nw_dim_city**
| column name                     | type | unit |
|-----------------------------|------|------|
|kabupaten_id|whole number||
|operator|string||
|	java	|	string	|		|
|	island	|	string	|		|
|	region7	|	string	|		|
|	cluster_name	|	string	|		|
|	city	|	string	|		|

## **A.3. dax - columns**
______________________________________________________________________________________________________________________________________________________________________
**A.3.1. All City**
| column name                     | dax |
|-----------------------------|------|
|	id 	|	 'All City'[kabupaten_id]&'All City'[operator]	|
|	monthtext	|	SWITCH(Value(RIGHT('All City'[month],2)),<br />1,"Jan",<br />2,"Feb",<br />3,"Mar",<br />4,"Apr",<br />5,"May",<br />6,"Jun",<br />7,"Jul",<br />8,"Aug",<br />9,"Sep",<br />10,"Oct",<br />11,"Nov",<br />12,"Dec")	|
|	week_title	|	CONCATENATE("Week ", [week])	|
|	data_availability_final_score_negative	|	 if('All City'[data_availability_final_score]<0,1)	|
|	data_availability_final_score_positive	|	if('All City'[data_availability_final_score]>0,1)	|
|	data_availability_final_score_status	|	if('All City'[data_availability_final_score]>0,"Positive","Negative")	|
|	web_browsing_final_score_negative	|	 if('All City'[web_browsing_final_score]<0,1)	|
|	web_browsing_final_score_positive	|	if('All City'[web_browsing_final_score]>0,1)	|
|	web_browsing_final_score_status	|	if('All City'[web_browsing_final_score]>0,"Positive","Negative")	|
|	streaming_final_score_negative	|	 if('All City'[streaming_final_score]<0,1)	|
|	streaming_final_score_positive	|	if('All City'[streaming_final_score]>0,1)	|
|	streaming_final_score_status	|	if('All City'[streaming_final_score]>0,"Positive","Negative")	|
|	social_media_final_score_negative	|	 if('All City'[social_media_final_score]<0,1)	|
|	social_media_final_score_positive	|	if('All City'[social_media_final_score]>0,1)	|
|	social_media_final_score_status	|	if('All City'[social_media_final_score]>0,"Positive","Negative")	|
|	gaming_final_score_negative	|	 if('All City'[gaming_final_score]<0,1)	|
|	gaming_final_score_positive	|	if('All City'[gaming_final_score]>0,1)	|
|	gaming_final_score_status	|	if('All City'[gaming_final_score]>0,"Positive","Negative")	|
|	tnps_data_availability_score	|	VAR total =<br /> 'All City'[data_availability_promotor_n] + 'All City'[data_availability_detractor_n]<br />VAR passive =<br />DIVIDE('All City'[data_availability_promotor_n],total)<br />VAR promotor =<br />DIVIDE('All City'[data_availability_promotor_n],total)<br />VAR detractor =	|
|	tnps_web_browsing_score	|	VAR total =<br /> 'All City'[web_browsing_promotor_n] + 'All City'[web_browsing_detractor_n]<br />VAR passive =<br />DIVIDE('All City'[web_browsing_promotor_n],total)<br />VAR promotor =<br />DIVIDE('All City'[web_browsing_promotor_n],total)<br />VAR detractor =	|
|	tnps_streaming_score	|	VAR total =<br /> 'All City'[streaming_promotor_n] + 'All City'[streaming_detractor_n]<br />VAR passive =<br />DIVIDE('All City'[streaming_promotor_n],total)<br />VAR promotor =<br />DIVIDE('All City'[streaming_promotor_n],total)<br />VAR detractor =	|
|	tnps_social_media_score	|	VAR total =<br /> 'All City'[social_media_promotor_n] + 'All City'[social_media_detractor_n]<br />VAR passive =<br />DIVIDE('All City'[social_media_promotor_n],total)<br />VAR promotor =<br />DIVIDE('All City'[social_media_promotor_n],total)<br />VAR detractor =	|
|	tnps_gaming_score	|	VAR total =<br /> 'All City'[gaming_promotor_n] + 'All City'[gaming_detractor_n]<br />VAR passive =<br />DIVIDE('All City'[gaming_promotor_n],total)<br />VAR promotor =<br />DIVIDE('All City'[gaming_promotor_n],total)<br />VAR detractor =	|

**A.3.2. nw_city_squad**
| column name                     | dax |
|-----------------------------|------|
|kabupaten|LOWER(nw_city_squad[city])|

## **A.4. dax - measures**
--------------------------------------------------------------------------------------------------
**A.4.1. by Parameter**
| column name                     | dax |
|-----------------------------|------|
|	Chose Value Parameter	|	if(min('by Parameter'[id]),MIN('by Parameter'[id]))	|
|	Subs Delta N	|	[Subs promotor N]-[Subs Detractor N]	|
|	Subs Delta Rate	|	[Subs promotor Rate]-[Subs Detractor Rate]	|
|	Subs Detractor N	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,SUM('All City'[data_availability_detractor_n]),<br />2,SUM('All City'[web_browsing_detractor_n]),<br />3,SUM('All City'[streaming_detractor_n]),<br />4,SUM('All City'[social_media_detractor_n]),<br />5,SUM('All City'[gaming_detractor_n]))<br />	|
|	Subs Passive N	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,SUM('All City'[data_availability_passive_n]),<br />2,SUM('All City'[web_browsing_passive_n]),<br />3,SUM('All City'[streaming_passive_n]),<br />4,SUM('All City'[social_media_passive_n]),<br />5,SUM('All City'[gaming_passive_n]))<br />	|
|	Subs Promotor N	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,SUM('All City'[data_availability_promotor_n]),<br />2,SUM('All City'[web_browsing_promotor_n]),<br />3,SUM('All City'[streaming_promotor_n]),<br />4,SUM('All City'[social_media_promotor_n]),<br />5,SUM('All City'[gaming_promotor_n]))<br />	|
|	Subs Detractor Rate	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,DIVIDE(SUM('All City'[data_availability_detractor_n]),sum('All City'[data_availability_n_subs])),<br />2,DIVIDE(SUM('All City'[web_browsing_detractor_n]),sum('All City'[web_browsing_n_subs])),<br />3,DIVIDE(SUM('All City'[streaming_detractor_n]),sum('All City'[streaming_n_subs])),<br />4,DIVIDE(SUM('All City'[social_media_detractor_n]),sum('All City'[social_media_n_subs])),<br />5,DIVIDE(SUM('All City'[gaming_detractor_n]),sum('All City'[gaming_n_subs])))<br />	|
|	Subs passive Rate	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,DIVIDE(SUM('All City'[data_availability_passive_n]),sum('All City'[data_availability_n_subs])),<br />2,DIVIDE(SUM('All City'[web_browsing_passive_n]),sum('All City'[web_browsing_n_subs])),<br />3,DIVIDE(SUM('All City'[streaming_passive_n]),sum('All City'[streaming_n_subs])),<br />4,DIVIDE(SUM('All City'[social_media_passive_n]),sum('All City'[social_media_n_subs])),<br />5,DIVIDE(SUM('All City'[gaming_passive_n]),sum('All City'[gaming_n_subs])))<br />	|
|	Subs Promotor Rate	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,DIVIDE(SUM('All City'[data_availability_promotor_n]),sum('All City'[data_availability_n_subs])),<br />2,DIVIDE(SUM('All City'[web_browsing_promotor_n]),sum('All City'[web_browsing_n_subs])),<br />3,DIVIDE(SUM('All City'[streaming_promotor_n]),sum('All City'[streaming_n_subs])),<br />4,DIVIDE(SUM('All City'[social_media_promotor_n]),sum('All City'[social_media_n_subs])),<br />5,DIVIDE(SUM('All City'[gaming_promotor_n]),sum('All City'[gaming_n_subs])))<br />	|
|	Subs detractor_avg_dw_rtt_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_rtt_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_rtt_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_rtt_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_rtt_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_rtt_mean]))	|
|	Subs detractor_avg_dw_rtt_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_rtt_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_rtt_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_rtt_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_rtt_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_rtt_stddev]))	|
|	Subs detractor_avg_ul_rtt_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_rtt_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_rtt_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_rtt_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_rtt_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_rtt_mean]))	|
|	Subs detractor_avg_ul_rtt_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_rtt_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_rtt_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_rtt_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_rtt_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_rtt_stddev]))	|
|	Subs detractor_l4_dw_throughput_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_throughput_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_throughput_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_throughput_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_throughput_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_throughput_mean]))	|
|	Subs detractor_l4_dw_throughput_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_throughput_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_throughput_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_throughput_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_throughput_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_throughput_stddev]))	|
|	Subs detractor_l4_ul_throughput_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_throughput_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_throughput_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_throughput_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_throughput_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_throughput_mean]))	|
|	Subs detractor_l4_ul_throughput_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_throughput_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_throughput_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_throughput_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_throughput_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_throughput_stddev]))	|
|	Subs detractor_tcp_dw_retrans_withpl_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_packets_loss_rate_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_packets_loss_rate_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_packets_loss_rate_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_packets_loss_rate_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_packets_loss_rate_mean]))	|
|	Subs detractor_tcp_dw_retrans_withpl_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_dl_packets_loss_rate_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_dl_packets_loss_rate_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_dl_packets_loss_rate_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_dl_packets_loss_rate_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_dl_packets_loss_rate_stddev]))	|
|	Subs detractor_tcp_ul_retrans_withpl_mean	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_packets_loss_rate_mean]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_packets_loss_rate_mean]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_packets_loss_rate_mean]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_packets_loss_rate_mean]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_packets_loss_rate_mean]))	|
|	Subs detractor_tcp_ul_retrans_withpl_variance	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_metric_ul_packets_loss_rate_stddev]),<br />2,AVERAGE('All City'[web_browsing_detractor_metric_ul_packets_loss_rate_stddev]),<br />3,AVERAGE('All City'[streaming_detractor_metric_ul_packets_loss_rate_stddev]),<br />4,AVERAGE('All City'[social_media_detractor_metric_ul_packets_loss_rate_stddev]),<br />5,AVERAGE('All City'[gaming_detractor_metric_ul_packets_loss_rate_stddev]))	|
|	Subs detractor_revenue_net	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_revenue_net]),<br />2,AVERAGE('All City'[web_browsing_detractor_revenue_net]),<br />3,AVERAGE('All City'[streaming_detractor_revenue_net]),<br />4,AVERAGE('All City'[social_media_detractor_revenue_net]),<br />5,AVERAGE('All City'[gaming_detractor_revenue_net]))	|
|	Subs passive_revenue_net	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_passive_revenue_net]),<br />2,AVERAGE('All City'[web_browsing_passive_revenue_net]),<br />3,AVERAGE('All City'[streaming_passive_revenue_net]),<br />4,AVERAGE('All City'[social_media_passive_revenue_net]),<br />5,AVERAGE('All City'[gaming_passive_revenue_net]))	|
|	Subs promotor_revenue_net	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_promotor_revenue_net]),<br />2,AVERAGE('All City'[web_browsing_promotor_revenue_net]),<br />3,AVERAGE('All City'[streaming_promotor_revenue_net]),<br />4,AVERAGE('All City'[social_media_promotor_revenue_net]),<br />5,AVERAGE('All City'[gaming_promotor_revenue_net]))	|
|	Subs detractor_u_mb	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_u_mb]),<br />2,AVERAGE('All City'[web_browsing_detractor_u_mb]),<br />3,AVERAGE('All City'[streaming_detractor_u_mb]),<br />4,AVERAGE('All City'[social_media_detractor_u_mb]),<br />5,AVERAGE('All City'[gaming_detractor_u_mb]))	|
|	Subs passive_u_mb	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_passive_u_mb]),<br />2,AVERAGE('All City'[web_browsing_passive_u_mb]),<br />3,AVERAGE('All City'[streaming_passive_u_mb]),<br />4,AVERAGE('All City'[social_media_passive_u_mb]),<br />5,AVERAGE('All City'[gaming_passive_u_mb]))	|
|	Subs promotor_u_mb	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_promotor_u_mb]),<br />2,AVERAGE('All City'[web_browsing_promotor_u_mb]),<br />3,AVERAGE('All City'[streaming_promotor_u_mb]),<br />4,AVERAGE('All City'[social_media_promotor_u_mb]),<br />5,AVERAGE('All City'[gaming_promotor_u_mb]))	|
|	Subs detractor_u_dw	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_detractor_u_dwe]),<br />2,AVERAGE('All City'[web_browsing_detractor_u_dwe]),<br />3,AVERAGE('All City'[streaming_detractor_u_dwe]),<br />4,AVERAGE('All City'[social_media_detractor_u_dwe]),<br />5,AVERAGE('All City'[gaming_detractor_u_dwe]))	|
|	Subs passive_u_dw	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_passive_u_dwe]),<br />2,AVERAGE('All City'[web_browsing_passive_u_dwe]),<br />3,AVERAGE('All City'[streaming_passive_u_dwe]),<br />4,AVERAGE('All City'[social_media_passive_u_dwe]),<br />5,AVERAGE('All City'[gaming_passive_u_dwe]))	|
|	Subs promotor_u_dw	|	SWITCH('by Parameter'[Chose Value Parameter],<br />1,AVERAGE('All City'[data_availability_promotor_u_dwe]),<br />2,AVERAGE('All City'[web_browsing_promotor_u_dwe]),<br />3,AVERAGE('All City'[streaming_promotor_u_dwe]),<br />4,AVERAGE('All City'[social_media_promotor_u_dwe]),<br />5,AVERAGE('All City'[gaming_promotor_u_dwe]))	|


## **A.5. ERD**
![ERD](https://github.com/pzap/dashboard-voyager/blob/main/titan/titan%20overview%20(city)/ERD.png)
