## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for this use case. Keyword search relies on exact or partial word matches, which fails when the query uses different wording than the document. 
For example, a lawyer might ask “What are the termination clauses?” while the contract uses phrases like “conditions for agreement dissolution” or “early exit provisions.” 
A keyword system may miss these relevant sections because it lacks an understanding of semantic meaning. 
Additionally, long legal documents (e.g., 500 pages) contain complex language, synonyms, and context-dependent phrasing, making keyword matching inefficient and often inaccurate.

A vector database addresses this limitation by enabling semantic search. 
In this approach, both the contract text (split into smaller chunks) and the user’s query are converted into embeddings—numerical vector representations that capture meaning. 
Instead of matching words, the system compares vectors using similarity measures (like cosine similarity) to find the most relevant sections, even if the wording differs.

This allows lawyers to retrieve precise answers quickly without manually scanning entire documents. 
The vector database stores and indexes these embeddings efficiently, making large-scale similarity search fast and scalable. 
In practice, it is often combined with a language model to generate concise answers from retrieved sections.

Thus, while keyword search is limited to surface-level matching, a vector database enables deeper, context-aware retrieval, which is essential for analyzing complex legal contracts.
