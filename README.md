# 1) Project Workflow :

- build your virtual environment using build_venv.ps1 (in Windows) or build_venv.sh (for Linux),
- active your venv inside the jupyter notebook (*.ipynb) to learn the topic below,

# 2) LlamaIndex : créer son RAG en quelques lignes de code

LlamaIndex est un **framework Python open source spécialisé dans la création de systèmes RAG et d'applications basées sur les LLM.**
**Sa promesse** : permettre de construire un pipeline RAG fonctionnel en quelques lignes de code, tout en offrant la flexibilité nécessaire pour les cas d'usage avancés.
Là où d'autres frameworks adoptent une approche généraliste, LlamaIndex a fait le choix de l'excellence sur un périmètre précis :
==> **connecter vos données à des modèles de langage.**

La construction d'un système RAG (Retrieval Augmented Generation) peut rapidement devenir un projet complexe :

- gérer l'ingestion de documents,
- leur découpage en chunks,
- la création d'embeddings,
- le stockage vectoriel,
- puis orchestrer la récupération et la génération...

Chaque étape nécessite des choix techniques et du code d'intégration.
Pour les équipes qui souhaitent se concentrer sur la valeur métier plutôt que sur la plomberie technique, LlamaIndex offre une alternative séduisante.

Dans ce repo, nous allons explorer ce qu'est LlamaIndex, comprendre son architecture et ses composants clés, et voir concrètement comment construire un RAG opérationnel en quelques minutes.

## LlamaIndex : un framework pensé pour le RAG

LlamaIndex est né d'un constat simple :

- *les LLM sont puissants mais limités par leur connaissance figée au moment de leur entraînement.*
  Pour les rendre utiles sur des données propriétaires - documentation interne, bases de connaissances, corpus métier - il faut les augmenter avec un système de récupération.
  ==> **C'est précisément ce que LlamaIndex facilite.**

Le framework s'articule autour de **cinq étapes fondamentales** qui correspondent au cycle de vie d'un système RAG :

- **Loading :** ingestion des données depuis diverses sources (fichiers, bases de données, APIs),
- **Indexing :** structuration des données pour une recherche efficace (chunking, embeddings, stockage),
- **Storing :** persistance des index pour éviter de recalculer à chaque utilisation,
- **Querying :** récupération des informations pertinentes et génération de réponses,
- **Evaluation :** mesure de la qualité du système pour l'améliorer itérativement.

Cette organisation reflète la philosophie de LlamaIndex :
==> **fournir des abstractions de haut niveau pour chaque étape tout en permettant de descendre dans les détails quand nécessaire.
Un développeur peut construire un RAG fonctionnel sans comprendre les subtilités du chunking, puis affiner progressivement chaque composant à mesure que ses besoins se précisent.

| **Composant**         | **Rôle**                              | **Exemples**                                  |
| --------------------------- | -------------------------------------------- | --------------------------------------------------- |
| **Data Connectors**   | Charger des données depuis diverses sources | SimpleDirectoryReader, PDFReader, NotionReader      |
| **Documents & Nodes** | Représenter et découper les données       | Document, TextNode, ImageNode                       |
| **Embeddings**        | Vectoriser le texte pour la recherche        | OpenAIEmbedding, HuggingFaceEmbedding               |
| **Index**             | Structurer les données pour la requête     | VectorStoreIndex, SummaryIndex, KnowledgeGraphIndex |
| **Retrievers**        | Récupérer les informations pertinentes     | VectorIndexRetriever, BM25Retriever                 |
| **Query Engine**      | Orchestrer récupération et génération    | RetrieverQueryEngine                                |

La force de LlamaIndex réside dans ses **connecteurs de données** qui couvrent un spectre impressionnant de sources :

- fichiers locaux (PDF, Word, HTML, Markdown),
- bases de données (PostgreSQL, MongoDB),
- services cloud (Google Drive, Notion, Slack),
- et même des APIs web.

Cette richesse permet d'intégrer rapidement des données existantes sans développement spécifique.

# **LlamaIndex vs LangChain : quelles différences ?**

La comparaison avec [LangChain](https://blent.ai/blog/a/langchain-framework-llm) est inévitable car les deux frameworks adressent des problématiques similaires. Comprendre leurs différences permet de choisir l'outil le plus adapté à chaque projet.

- **LangChain** adopte une approche **généraliste** : c'est une boîte à outils complète pour construire des applications LLM de toute nature. Son abstraction centrale, la "chain", permet de composer des séquences d'opérations arbitraires. Cette flexibilité a un coût : la courbe d'apprentissage est plus raide, et construire un RAG nécessite d'assembler manuellement plusieurs composants.
- **LlamaIndex** est **spécialisé** dans la connexion de données aux LLM. Son abstraction centrale, l'index, est optimisée pour ce cas d'usage précis. Cette spécialisation se traduit par une expérience plus fluide pour les projets RAG : moins de code boilerplate, des défauts sensés, et une documentation focalisée.

| Critère                     | LlamaIndex                    | LangChain                               |
| ---------------------------- | ----------------------------- | --------------------------------------- |
| Focus principal              | RAG et indexation de données | Applications LLM génériques           |
| Courbe d'apprentissage       | Douce pour le RAG             | Plus raide, plus de concepts            |
| Lignes de code (RAG basique) | ~5 lignes                     | ~15-20 lignes                           |
| Connecteurs de données      | Très riche (150+)            | Moins exhaustif                         |
| Agents et workflows          | Supportés mais secondaires   | Point fort historique                   |
| Écosystème                 | LlamaHub pour les extensions  | LangChain Hub, intégrations nombreuses |

En pratique, les deux frameworks ne sont pas mutuellement exclusifs. De nombreux projets utilisent LlamaIndex pour la partie indexation et récupération, puis LangChain pour l'orchestration de workflows plus complexes. LlamaIndex propose d'ailleurs des intégrations natives avec LangChain pour faciliter cette complémentarité.

Le choix dépend de votre cas d'usage :

* **Projet centré sur le RAG** avec des besoins d'indexation complexes → LlamaIndex
* **Application LLM diverse** avec agents, chaînes de prompts, intégrations multiples → LangChain
* **Prototype rapide** pour valider une approche RAG → LlamaIndex (moins de friction initiale)
