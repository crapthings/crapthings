# Odin RDF 生态建议

## 总体分层

```text
基础层：odin-rdf / odin-vocab
存储层：odin-store / odin-graph
语义层：odin-reasoner / odin-shacl / odin-ontology
查询层：odin-sparql / odin-query
应用层：odin-cli / odin-server
验证层：odin-testdata / benchmarks
```

## 建议的组件边界

### `odin-rdf`

负责 RDF term、triple/quad、datatype、解析与序列化。

不负责规则推理、SHACL 验证、SPARQL 查询或持久化存储。

### `odin-reasoner`

负责拥有式 fact store、规则 IR、forward chaining、provenance 和资源限制。

建议在其中实现：

- RDFS；
- OWL 2 RL；
- SWRL；
- RIF Core；
- 受限 RIF-BLD；
- built-ins 和规则解释能力。

建议目录：

```text
odin-reasoner/reasoner/
  term/
  store/
  rule/
  builtin/
  rdfs/
  owlrl/
  swrl/
  rif/
  adapter/sparql/
```

SWRL 和 RIF 当前不必拆成独立 repo。先作为 reasoner 的语言前端和编译器，等 AST、parser 和公共 API 稳定后再评估拆分。

RIF-PRD 与纯逻辑规则不同，涉及生产规则、优先级、冲突解决和动作执行，应单独评估，必要时独立为生产规则引擎。

### `odin-sparql`

负责 SPARQL parser、algebra、query planning、查询执行和结果格式。

Reasoner 可以通过只读 closure snapshot 适配到 SPARQL，但 SPARQL 不应成为推理核心依赖。

### `odin-store` / `odin-graph`

负责持久化、索引、named graph、dataset、事务和可变 Graph Store。

当前不宜过早抽取。应等 SPARQL 和 reasoner 的 term dictionary、索引、snapshot、事务需求稳定后再形成共享存储层。

### `odin-shacl`

负责 SHACL shape 解析、约束验证和 validation report。

SHACL 是验证系统，不应与 RDFS/OWL/SWRL 推理混为一套语义引擎。

### `odin-vocab`

提供 RDF、RDFS、OWL、XSD、SHACL、PROV 等常用词汇的 IRI 常量和轻量辅助函数。

它应保持轻量，尽量不依赖完整 reasoner。

### `odin-ontology`

负责 ontology 文档加载、`owl:imports`、prefix、版本和文档解析策略。

网络访问、缓存和权限策略应由应用层注入，不应硬编码进 reasoner。

### `odin-query`

可作为未来的查询规划和 query rewriting 层，处理按需推理、SPARQL entailment regime 或基于本体的查询改写。

在没有明确 workload 前，不必立即创建。

### `odin-cli`

将生态能力串成可用工具：

```text
odin parse
odin convert
odin reason
odin validate
odin query
odin explain
```

### `odin-server`

负责 HTTP/API、认证、任务调度、缓存、上传和服务生命周期。

这些能力属于应用层，不应塞进 RDF、reasoner 或 SPARQL 核心包。

### `odin-testdata`

集中维护 W3C conformance tests、跨包 fixtures、回归样例和基准数据。

各组件仍应保留最贴近实现的单元测试，但跨仓库行为应有统一测试语料和兼容性矩阵。

## 推荐优先级

1. 稳定 `odin-rdf` 的 term 和 parser 公共 API。
2. 在 `odin-reasoner` 中先实现 SWRL 基础规则。
3. 增加 `odin-shacl`，建立独立的 validation report 模型。
4. 稳定 reasoner 的 SPARQL closure adapter。
5. 提取常用词汇为 `odin-vocab`。
6. 根据实际规模和事务需求抽取 `odin-store` / `odin-graph`。
7. 实现 `odin-cli`，提供统一工作流。
8. 在有明确按需推理需求后再做 `odin-query`。
9. 最后评估 RIF-BLD、RIF-PRD、服务端和大规模持久化。

## 需要优先稳定的公共契约

生态扩展前，建议先稳定以下四个协议：

1. RDF term identity：term kind、lexical value、datatype、language tag 和 blank-node scope。
2. Dataset / graph store：default graph、named graph、scan、snapshot、事务边界。
3. Rule IR：triple atom、变量、equality、builtin、结论、资源限制和 provenance。
4. Validation / provenance report：错误、证据、来源、规则 ID 和可解释输出。

## 总体原则

- 先模块化，后拆 repo。
- 先稳定协议，后共享具体容器。
- 推理、验证、查询和存储保持语义边界。
- RIF/SWRL 的语言层可以放在 reasoner 仓库，但不应污染 RDF 基础层。
- 不把完整 SPARQL、网络访问或服务端生命周期塞进 reasoner 核心。
