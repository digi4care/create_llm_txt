# LLM_TXT & LLM_TREE Generator

A lightweight Bash utility that prepares source code for ingestion by large language models (LLMs) by generating a single clean `.txt` file that includes a directory tree and all relevant file contents — following the `LLM_TXT` formatting guidelines.

---

## 📌 Overview

`llm_txt.sh` is designed to streamline your entire project into one neatly formatted text file for use in LLMs, such as ChatGPT, Claude, or custom AI agents. It eliminates clutter and ensures proper structure so the model can understand your codebase without distractions.

It produces two output files:
- `llm_txt.txt`: A complete dump of all relevant code files, clearly separated and labeled.
- `llm_tree.txt`: A visual tree-style overview of the project directory (excluding irrelevant files/folders).

---

## ✨ Features

- 📂 Clean directory tree with excluded folders and files.
- 📄 Full content of your source code, with file boundaries and clear headers.
- 🚫 Skips common noise like `.git`, `.vscode`, and config files.
- 🔍 Extension-based file filtering for precise control.
- 🤖 Follows the `LLM_TXT` standard for optimal AI understanding.

---

## 📁 Output Files

| Filename         | Description                                                  |
|------------------|--------------------------------------------------------------|
| `llm_txt.txt`    | The main file: includes the project tree and all file contents |
| `llm_tree.txt`   | Just the directory structure as plain text                    |

---

## 📜 What are the `LLM_TXT` guidelines?

The `LLM_TXT` format defines how to structure code and project information in a single `.txt` file so that it can be consumed effectively by large language models.

### The core principles:

- ✅ All content in **one file**
- ✅ Clear **file separation** using headers like `---- filename ----`
- ✅ Exclude unnecessary files and directories (e.g., `.git`, `node_modules`, backups)
- ✅ Include a **tree overview** at the top to provide structure
- ✅ Sorted, readable, and minimal — no byte sizes, no timestamps, no extra metadata

---

## 🧠 Why follow `LLM_TXT`?

When you're feeding code to an LLM, clarity and structure are essential:

- **Context**: The LLM needs to know which file it's reading and how files relate.
- **Focus**: Removing noise improves the model’s accuracy and reduces token waste.
- **Speed**: Single-file input means faster uploads and quicker analysis.
- **Precision**: Clean input helps the model provide better completions, summaries, and refactorings.

> This script ensures your codebase is formatted exactly how an LLM expects it — no prep needed.

---

## ⚙️ Usage

### 1. Make the script executable:
```bash
chmod +x llm_txt.sh
````

### 2. Run the script:

```bash
./llm_txt.sh
```

Two files will be created:

* `llm_txt.txt`
* `llm_tree.txt`

---

## 🔧 Configuration

Within the script, you can customize:

```bash
extensions=("*.*")                     # Set which files to include (e.g., "*.js" "*.php")
exclude_dirs=(".vscode" ".git" ".qodo")  # Skip these folders
exclude_files=("llm_txt.txt" "kubeconfig")  # Skip these files
```

---

## 👨‍💻 Author

* **Chris Engelhard**
* 📧 [chris@chrisengelhard.nl](mailto:chris@chrisengelhard.nl)
* 🌍 [https://www.chrisengelhard.nl](https://www.chrisengelhard.nl)
* 🏢 Digi4Care
* 📦 Version: `1.0.1`
* 📅 Date: `2025-05-06`

---

## 🪪 License

This script is open-source and free to use or modify for any personal or commercial purpose.