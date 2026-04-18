---
title: AI Chatbot for Internal Knowledge Base
order: 1
summary: Chatbot nội bộ giúp nhân viên tra cứu tài liệu nhanh bằng RAG + FAISS.
tech: [Python, FastAPI, FAISS, OpenAI API, RAG]
repo:
demo:
---

## Bài toán

Nhân viên mất nhiều thời gian tra cứu tài liệu nội bộ (quy trình, chính sách, handbook). Cần một chatbot có thể trả lời chính xác dựa trên kho tài liệu hiện có.

## Giải pháp

- **Ingestion pipeline**: chunk tài liệu → embed bằng sentence-transformers → lưu vào FAISS.
- **Retrieval**: top-k semantic search + re-ranking.
- **Generation**: LLM (OpenAI-compatible API) trả lời kèm trích dẫn nguồn.
- **API**: FastAPI expose endpoint `/chat` cho frontend tích hợp.

## Công nghệ

Python, FastAPI, FAISS, sentence-transformers, OpenAI-compatible API.

## Kết quả

- Giảm ~60% thời gian tìm tài liệu.
- Tăng độ chính xác nhờ trích dẫn nguồn trực tiếp.
- Dễ mở rộng thêm bộ tài liệu mới qua pipeline ingestion.
