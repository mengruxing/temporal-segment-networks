from benchmark_db import *


split_parsers = dict()
split_parsers['ucf101'] = parse_ucf_splits
split_parsers['hmdb51'] = parse_hmdb51_splits
split_parsers['jhmdb'] = parse_jhmdb_splits
split_parsers['jhmdb_c15'] = parse_jhmdb_splits
split_parsers['jhmdb_c10'] = parse_jhmdb_splits
split_parsers['jhmdb_c5'] = parse_jhmdb_splits
split_parsers['activitynet_1.2'] = lambda: parse_activitynet_splits("1.2")
split_parsers['activitynet_1.3'] = lambda: parse_activitynet_splits("1.3")


def parse_split_file(dataset):
    sp = split_parsers[dataset]
    return sp()

