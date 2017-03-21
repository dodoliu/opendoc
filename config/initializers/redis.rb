#为redis指定一个命名空间
$redis = Redis::Namespace.new("opendoc", :redis => Redis.new)