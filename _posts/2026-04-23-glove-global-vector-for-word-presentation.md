---
title: "GloVe: Global Vectors for Word Representation"
date: 2026-04-23 14:34:32 +0700
categories: [Machine Learning, NLP]
tags: [embedding, nlp, machine-learning]
math: true
mermaid: false
pin: false
image:
  path: /assets/img/posts/2026-04-23-glove-global-vector-for-word-presentation/cover.png
  alt: glove global vector for word presentation
---
## 1. GloVe là gì?

Là phương pháp học không có giám sát ( Unsupervised Learning), học nghĩa của từ từ toàn bộ thống kê đồng xúât hiện (co-occurence) trong kho văn bản, chứ không chỉ nhìn từng câu riêng lẻ như Word2Vec. Nói đơn giản, nếu hai từ thường đi cùng các kiểu từ giống nhau, mô hình sẽ học ra mối liên hệ giữa chúng. 

## 2. Bối cảnh

GloVe (Global Vector for Word Representation) ra đời nằm 2014 bởi các nhà nghiên cứu tại Đại học Standford, trong bối cảnh các mô hình nhúng từ như Word2Vec rất thành công nhưng vẫn có nhiều hạn chế

Hạn chế của các phương pháp trước đó:

1. Mô hình phân tích ma trận toàn cục (như LSA — Latent  Semantic Analysis): Thường swr dụng thống kê toàn cục của ngữ liệu tốt, nhưng khả năng biểu diễn ngữ nghĩa trong các tác vụ suy luận như (King - Man + Woman $$\approx$$ Queen) kém.
2. Mô hình dự báo cục bộ ( như Word2Vec — Skip-gram): Rất tốt trong việc nắm bắt ngữ nghĩa và các mối quan hệ tương tự như (King - Man + Woman $\approx$ Queen), nhưng lãng phí các thống kê toàn cục do chỉ huấn luyện trên các cửa sổ ngữ cảnh nhỏ. 

GloVe ra đời như một mô hình lai (hybrid), tận dụng những ưu điểm của 2 phương pháp trên. 

## 2. Ma trận đồng xuất hiện ( co-occurence)

Hãy tưởng tượng mình đọc rất nhiều câu và đếm xem từ nào hay xuất hiện cùng từ nào, từ đó tạo ra một ma trận dồng xuất hiện $$\mathbf{X}$$ trong đó $$\mathbf{X}_{ij}$$ là số lần từ $$j$$ xuất hiện trong ngữ cảnh của từ $$i$$.

Giả sử ta chỉ có 4 từ: “mèo”, “chó”, “sủa”, “kêu”, và vài câu minh họa như “chó sủa”, “mèo kêu”, “chó sủa to”, “mèo kêu nhỏ”. Nếu đếm số lần xuất hiện gần nhau thì ta có một bảng như sau: 

| Từ trung tâm | mèo | chó | sủa | kêu |
| --- | --- | --- | --- | --- |
| mèo | 0 | 0 | 0 | 2 |
| chó | 0 | 0 | 2 | 0 |
| sủa | 0 | 2 | 0 | 0 |
| kêu | 2 | 0 | 0 | 0 |

Từ đó ta định nghĩa: 

$$
\mathbf{X}_i = \sum_{k} \mathbf{X}_{ik} 
$$

$$
P_{ij} = \frac{\mathbf{X}_{ij}}{\mathbf{X}_i}
$$

Trong đó $P_{ij}$ là xác suất từ $j$ xuất hiện gần từ $i$.

## 3. Tỉ lệ xác suất và trực giác về ngữ nghĩa.

Trong paper gốc của GloVe, nhóm nghiên cứu cho rằng điểm bắt đầu phù hợp cho việc học vector từ là tỉ lệ của các xuất suất đồng xuất hiện, chứ không phải bản thân các xác suất đó. Lý do là xác suất tuyệt đối dễ bị ảnh hưởng bởi nhiều t ừ xuất hiện quá phổ biến trong ngôn ngữ, nên chúng thường mang nhiều nhiễu hơn là thông tin phân biệt ngữ nghĩa.

Ví dụ đời thường như, nêus một người nói chuyện với hầu như tất cả mọi người, thì việc người đó nói chuyện với riêng mình không nói lên việc hai người thân nhau. Nên cần tìm một cách so sánh thông minh hơn.

Nếu gọi $P_{ik}$ là xác suất từ $k$ xuất hiện gần từ i thì GloVe quan tâm tỉ lệ sau:

$$
\frac{P_{ik}}{P_{jk}}
$$

Trong đó, $i$ và $j$ là hai từ cần so sánh, còn $k$ là một từ ngữ cảnh dùng để kiểm tra, xem nó nghiêng về từ nào hơn. Nếu tỉ lệ này lớn, từ k liên quan từ $i$ nhiều hơn $j$; nếu nhỏ, từ $k$ liên quan từ $j$ nhiều hơn $i$; nếu gần 1, từ $k$ không giúp phân biệt rõ hai từ đó.

Ví dụ ở ma trận trên có : $$\mathbf{X}_{mèo} = 2$$,  $$\mathbf{X}_{chó} = 2$$  , $$\mathbf{X}_{sũa} = 2$$, $$\mathbf{X}_{kêu}=2$$

$$
P(kêu | mèo) = \frac{2}{2} = 1
$$

$$
P(kêu | chó) = \frac{0}{2} = 0
$$

Từ đó, nếu lấy ngữ cảnh $k$ = kêu để so sánh “mèo” và “chó”, thì tỉ lệ là :

$$
\frac{P(kêu | mèo)}{P(kêu | chó)}
$$

Tỷ lệ này rất lớn, nêu “kêu” là từ giúp phân biệt “mèo” với “chó” tốt. 

**Trực giác ngữ nghĩa** 

![**So sánh xác suất và tỉ lệ xác suất của các từ ngữ cảnh để thấy từ nào phân biệt tốt giữa “ice” và “steam”(tham khảo [GloVe paper](https://nlp.stanford.edu/pubs/glove.pdf))**](/assets/img/posts/2026-04-23-glove-global-vector-for-word-presentation/image.png)

**So sánh xác suất và tỉ lệ xác suất của các từ ngữ cảnh để thấy từ nào phân biệt tốt giữa “ice” và “steam”(tham khảo [GloVe paper](https://nlp.stanford.edu/pubs/glove.pdf))**

Ví dụ nổi tiếng trong tài liệu GloVe là so sanh hai từ “ice” và “steam”. Nếu chọn từ ngữ cảnh k = “solid”, thì tỉ lệ $\frac{P(solid|ice)}{P(solid|steam)}$ sẽ rất lớn (8.9) vì “solid” liên quan đến “ice” nhiều hơn “steam”.

Ngược lại, nếu chọn k = “gas”, thì tỉ lệ đó sẽ rất nhỏ, vì “gas” liên quan đến “steam” nhiều hơn “ice”. Nếu k = “water, tỉ lệ sẽ gầ 1 vì “water” liên quan đến cả hai từ nên không giúp phân biệt mạnh. Tương tự k = “fashion” tỉ lệ cũng gần bằng 1 vì cả hai đều không liên quan đến “fashion”.

Chính vì vậy, GloVe cho rằng ý nghĩa ngôn ngữ nằm ở sự khác biệt tương đối giữa các từ chứ không chỉ số lần xuất hiện của chúng. Tức là các từ ngữ cảnh cho tỉ lệ rất lớn hoặc rất nhỏ mới là những từ mang phân biệt ngữ cảnh mạnh.

## 4. Công thức chính

Cuối cùng, GloVe xây dựng được một công thức liên hệ giữa vector từ và số lần các từ xuất hiện cùng nhau: $$\mathbf{w}^\top _i\tilde{\mathbf{w}}_j + b_i + \tilde{b}_j = \log(\mathbf{X}_{ij})$$

Trong đó:

- $$\mathbf{w}_i$$:vector của từ trung tâm $$i$$
- $$\tilde{\mathbf{w}_j}$$: vector từ ngữ cảnh $$j$$
- $$b_i$ và $\tilde{b_j}$$: các bias giúp mô hình học linh hoạt hơn.
- $$\mathbf{X}_{ij}$$: số lần từ $$j$$ xuất hiện gần từ $$i$$

⇒ GloVe học vector sao cho tích vô hướng của hai từ phản ánh mức độ chúng đi cùng nhau trong dữ liệu.

## 5.Hàm mất mát.

$$
J= \sum_{i,j=1}^{V} f(\mathbf{X}_{ij})(\mathbf{w}^\top _i\tilde{\mathbf{w}}_j + b_i + \tilde{b}_j - \log(\mathbf{X}_{ij}))^2 
$$

Đo tổng sai số giữa giá trị mô hình dự đoán và giá trị thật $\log(\mathbf{X}_{ij}$). Nếu mô hình đoán càng lệch thì sai số càng lớn, nên quá trình huấn luyện sẽ cố làm cho $J$ nhỏ xuống.

Hàm $f(\mathbf{X}_{ij})$ là trọng số, dùng để điều chỉnh mức độ quan trọng của từng cặp từ. Giúp giảm ảnh hưởng các các cặp từ quá hiếm hoặc các cặp từ quá phổ biến. 

**Dạng hàm trọng số** $f(x)$

$$
f(x) = 
\begin{cases}
\left( \dfrac{x}{x_{\max}} \right)^{\alpha} & \text{nếu } x < x_{\max} \\[8pt]
1 & \text{nếu } x \ge x_{\max}
\end{cases}
$$

![image.png](/assets/img/posts/2026-04-23-glove-global-vector-for-word-presentation/image%201.png)

- Nếu $$\mathbf{X}_{ij}$$$ còn nhỏ, trọng số vẫn tăng  nhưng không quá mạnh
- Bỏ qua các cặp không xuất hiện: $$f(0)=0$$
- Nếu $$\mathbf{X}_{ij}$$ đủ lớn, trọng số được chặn ở mức 1, tránh để các cặp quá phổ biến chi phối mô hình.

## 6. Quy trình huấn luyện

Bước 1: Thu thập một kho văn bản lớn 

Bước 2: Tạo ma trận đồng xuất hiện (co-occurence) X

Bước 3: Khởi tạo ngẫu nhiên các vector và bias. 

- Mỗi từ sẽ có vector từ trung tâm (center word) $$w_i$$, vector ngữ cảnh $$\tilde{w}_j$$, và các bias $$b_i$$, $$\tilde{b}_j$$.

Bước 4: Tính sai số và tối ưu hàm mất mát $$J$$
- mô hình cố làm cho: $$\mathbf{w}^\top _i\tilde{\mathbf{w}}_j + b_i + \tilde{b}j \approx \log(\mathbf{X}{ij})$$ rồi đo sai số hàm mất mát có trọng số: $$J= \sum_{i,j=1}^{V} f(\mathbf{X}_{ij})(\mathbf{w}^\top _i\tilde{\mathbf{w}}_j + b_i + \tilde{b}j - \log(\mathbf{X}{ij}))^2$$

Bước 5: Cập nhật tham số nhiều lần cho đến khi hội tụ (dùng gradient descent) 

**Pseudo code**:

```jsx
Algorithm: GloVe Training

Input:
    Corpus of text
    window_size
    vector_dimension d
    x_max
    alpha
    num_epochs
    learning_rate

Output:
    word vectors W
    context vectors W_tilde
    biases b, b_tilde

1. Build co-occurrence matrix X
    for each sentence in the corpus:
        for each target word i in the sentence:
            for each context word j within the window around i:
                increment X[i][j]

2. Initialize parameters
    for each word i in the vocabulary:
        initialize W[i] randomly
        initialize W_tilde[i] randomly
        initialize b[i] = 0
        initialize b_tilde[i] = 0

3. Train the model
    for epoch = 1 to num_epochs:
        for each pair (i, j) such that X[i][j] > 0:
            weight = f(X[i][j])

            prediction = dot(W[i], W_tilde[j]) + b[i] + b_tilde[j]
            target = log(X[i][j])

            error = prediction - target
            loss = weight * error^2

            compute gradients of loss with respect to:
                W[i], W_tilde[j], b[i], b_tilde[j]

            update parameters using gradient descent

4. Return learned embeddings
    return W, W_tilde, b, b_tilde
```

## Tài liệu tham khảo

Pennington, J., Socher, R., & Manning, C. D. (2014). GloVe: Global Vectors for Word Representation. EMNLP 2014, 1532–1543. ([link](https://aclanthology.org/D14-1162/))

Dive into Deep Learning. *GloVe: Embedding từ với Vector Toàn cục*. ([link](https://d2l.aivivn.com/chapter_natural-language-processing-pretraining/glove_vn.html))