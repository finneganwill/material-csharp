# DbContext

## 一、是什么
DbContext 实例表示与数据库的会话，可用于查询和保存实体的实例。 DbContext 是工作单元和存储库模式的组合。

Entity Framework Core 不支持在同一 DbContext 实例上运行多个并行操作。 这包括异步查询的并行执行以及从多个线程进行的任何显式并发使用。 因此，请始终立即等待异步调用，或者对并行执行的操作使用单独的 DbContext 实例。

## 二、生存周期
