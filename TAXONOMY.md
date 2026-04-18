# Taxonomy — Categories & Tags cho AI/ML Engineer Blog

Chuẩn phân loại để giữ blog có cấu trúc rõ, dễ tìm lại, SEO tốt. Dùng làm tham chiếu khi viết bài mới.

## Nguyên tắc

- **Categories** = phân loại rộng, tối đa 2 cấp: `[Lĩnh vực chính, Chủ đề phụ]`
- **Tags** = từ khóa kỹ thuật cụ thể, viết thường, dùng gạch ngang (`vector-db`, không `Vector DB`)
- **Mỗi bài:** 1 category chính + 0–1 category phụ + 3–6 tags
- **Tái sử dụng > Tạo mới** — cố gắng dùng tag đã có thay vì đặt tag mới mỗi bài

---

## 1. Cây Categories

```
AI Engineering
├── LLM              # Large Language Models
├── RAG              # Retrieval-Augmented Generation
├── Agents           # AI Agents, tool-calling, workflows
├── Prompt           # Prompt engineering, prompting techniques
└── Evaluation       # Đánh giá hệ thống AI

Machine Learning
├── Cơ bản           # Thuật toán nền tảng (Linear, Logistic, Tree...)
├── Deep Learning    # CNN, RNN, Transformer...
├── NLP              # Xử lý ngôn ngữ tự nhiên
├── Computer Vision  # Thị giác máy
└── Time Series      # Dự báo chuỗi thời gian

MLOps
├── Deployment       # Serving, API, containerization
├── Pipeline         # Training/inference pipeline
├── Monitoring       # Observability, logging, drift
├── Infrastructure   # K8s, cloud, GPU
└── CI/CD            # Automation cho ML

Data
├── Engineering      # ETL, data pipeline
├── Analysis         # EDA, visualization
└── Quality          # Data validation, cleaning

Tools                # Review tool/framework
Career               # Learning path, roadmap, kinh nghiệm
Blog                 # Meta, giới thiệu, bài ngoài chuyên môn
```

### Ví dụ cách ghi trong frontmatter

```yaml
# Bài về xây RAG với Qdrant
categories: [AI Engineering, RAG]

# Bài fundamentals về Linear Regression
categories: [Machine Learning, Cơ bản]

# Bài deploy model lên K8s
categories: [MLOps, Deployment]

# Bài roadmap
categories: [Career]

# Bài giới thiệu blog
categories: [Blog]
```

---

## 2. Danh sách Tags (chuẩn hóa)

Giữ danh sách này và chỉ thêm tag mới khi thực sự cần.

### AI / LLM

```
llm, gpt, claude, llama, mistral, gemini, qwen
prompt-engineering, few-shot, chain-of-thought, react-prompting
fine-tuning, lora, peft, rlhf, dpo
tokenization, context-window, inference, quantization
openai-api, anthropic-api, huggingface
```

### RAG

```
rag, retrieval, semantic-search, hybrid-search, re-ranking
embeddings, sentence-transformers
vector-db, faiss, qdrant, chroma, pinecone, weaviate
chunking, document-loader, ingestion
```

### Agents

```
agents, tool-calling, function-calling
langchain, llamaindex, langgraph, crewai, autogen
multi-agent, workflow, orchestration
mcp, a2a
```

### Evaluation

```
evaluation, llm-as-judge, ragas, deepeval
benchmark, mmlu, humaneval
hallucination, grounding, faithfulness
observability, tracing, langfuse, langsmith
```

### Machine Learning cơ bản

```
linear-regression, logistic-regression
decision-tree, random-forest, xgboost, lightgbm
svm, knn, naive-bayes
clustering, kmeans, dbscan
pca, feature-engineering, feature-selection
regression, classification, supervised-learning, unsupervised-learning
overfitting, regularization, cross-validation
```

### Deep Learning

```
deep-learning, neural-network, pytorch, tensorflow, keras
cnn, rnn, lstm, transformer, attention
backpropagation, gradient-descent, optimizer
dropout, batch-normalization
bert, gpt-architecture, diffusion
```

### NLP

```
nlp, text-classification, ner, sentiment-analysis
tokenization, word2vec, glove, bpe
seq2seq, machine-translation, summarization
```

### Computer Vision

```
computer-vision, image-classification, object-detection
yolo, resnet, vit, segmentation
opencv, pillow, augmentation
```

### MLOps / Deployment

```
mlops, llmops, deployment, serving
docker, kubernetes, helm
fastapi, flask, grpc, triton, vllm, tgi
ci-cd, github-actions, argo
model-registry, mlflow, wandb
experiment-tracking, versioning, dvc
model-drift, data-drift, monitoring
```

### Infrastructure

```
aws, gcp, azure
sagemaker, vertex-ai, bedrock
gpu, cuda, tpu
terraform, ansible
```

### Data

```
data-engineering, etl, elt
airflow, dbt, prefect, dagster
spark, pandas, polars, duckdb
postgresql, mongodb, redis
parquet, delta-lake
```

### Ngôn ngữ / Tools

```
python, sql, rust, go
jupyter, vscode, git
poetry, uv, conda
```

### Career / Meta

```
roadmap, learning-path, career, interview
ai-engineer, ml-engineer, data-scientist
book-review, course-review
intro, announcement
```

---

## 3. Bảng quy chiếu nhanh — bài thường viết

| Chủ đề bài viết | Categories | Tags gợi ý |
|---|---|---|
| Cơ bản 1 thuật toán ML | `[Machine Learning, Cơ bản]` | `<ten-thuat-toan>, python, scikit-learn, supervised-learning` |
| Xây RAG chatbot | `[AI Engineering, RAG]` | `rag, embeddings, vector-db, <db-chọn>, langchain` |
| Prompt engineering | `[AI Engineering, Prompt]` | `prompt-engineering, llm, <model-dùng>` |
| Deploy model lên K8s | `[MLOps, Deployment]` | `kubernetes, docker, <framework-serving>, mlops` |
| So sánh vector DB | `[Tools]` hoặc `[AI Engineering, RAG]` | `vector-db, qdrant, faiss, pinecone, benchmark` |
| Fine-tune LLM | `[AI Engineering, LLM]` | `fine-tuning, lora, <model>, huggingface` |
| Build AI agent | `[AI Engineering, Agents]` | `agents, tool-calling, <framework>, workflow` |
| Đánh giá RAG system | `[AI Engineering, Evaluation]` | `evaluation, rag, ragas, llm-as-judge` |
| Monitoring ML production | `[MLOps, Monitoring]` | `mlops, monitoring, model-drift, observability` |
| Data pipeline cho ML | `[Data, Engineering]` | `data-engineering, airflow, etl, <tool>` |
| Roadmap học AI | `[Career]` | `roadmap, ai-engineer, learning-path` |
| Ghi chú đọc paper | `[AI Engineering, LLM]` | `paper-review, <chủ-đề>` |

---

## 4. Quy tắc đặt tag

### ✅ Nên

- **Viết thường, dấu gạch ngang:** `machine-learning`, `vector-db`
- **Ngắn gọn, đơn nghĩa:** `rag`, không phải `retrieval-augmented-generation`
- **Dùng tiếng Anh** cho concept kỹ thuật (SEO tốt hơn, quốc tế)
- **Tên công nghệ viết như chính thức:** `pytorch`, `fastapi`, `langchain`
- **Tái sử dụng tag đã có** — check danh sách trên trước khi tạo mới

### ❌ Tránh

- `Machine Learning`, `Vector_DB`, `RAG System` (viết hoa, gạch dưới, khoảng trắng)
- Tag quá chung: `ai`, `code`, `tutorial` (vô nghĩa khi mọi bài đều có)
- Tag quá hẹp: `linear-regression-with-sklearn-on-housing-dataset`
- Trùng với category: bài đã có category `RAG` thì không cần tag `rag` nữa (tùy chọn)
- Tag tiếng Việt có dấu: `hồi-quy-tuyến-tính` → dùng `linear-regression`

---

## 5. Migration các bài hiện có

Các bài viết hiện tại đang dùng categories khá tùy tiện. Nên chuẩn hóa:

| Post hiện tại | Categories cũ | Categories mới | Tags thêm |
|---|---|---|---|
| welcome-ai-engineer-blog | `[AI, Blog]` | `[Blog]` | `intro, announcement` |
| bai-viet-dau-tien | `[Blog]` | `[Blog]` | giữ nguyên |
| llmops-roadmap | `[AI, Roadmap]` | `[Career]` | `roadmap, llmops, mlops` |
| rag-first-notes | `[AI, RAG]` | `[AI Engineering, RAG]` | giữ + thêm `chunking` |
| linear-regression | `[Machine Learning, Cơ bản]` | giữ nguyên ✓ | giữ nguyên ✓ |
