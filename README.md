# tpch_2_17
tpch_2_17 change text length

## dbgen/dbgen.sh 直接生成压缩的数据库表文件

```bash
cd dbgen
bash dbgen.sh ./dbgen -s 120
```

see [dbgen/README](dbgen/README)

## lineitem comment 文本长度
dbgen 原版中 lineitem comment 文本(平均)长度 `L_CMNT_LEN` 是宏定义为 27.

我们的修改版中，该长度可以通过环境变量 `L_CMNT_LEN` 来定义，最大是`L_CMNT_MAX`(我们改成了`16384`)，默认值仍然是原版中的 27，例如：

```bash
env L_CMNT_LEN=512 ./dbgen -s 120
```

如果修改了 `L_CMNT_LEN` ， `-s` 参数的含义会发生变化。原版中 `-s 1` 表示数据的规模是 `1G`。
