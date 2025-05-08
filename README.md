# 🧠 LLM_TXT Generator

[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/chrisengelhard)
[![Shell](https://img.shields.io/badge/script-bash-lightgrey)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen.svg)](mailto:chris@chrisengelhard.nl)

> A powerful script that generates a clean, LLM-optimized `.txt` file of your entire project. Ideal for AI prompt engineering, documentation, and audits.

---

<details>
<summary>📌 Purpose</summary>

This script was designed to generate a unified `.txt` file that includes:
- A clean project **tree structure**
- The **full contents of all relevant source files**

This format follows the `llm_txt` methodology, optimized for input into **Large Language Models (LLMs)** like GPT. It's perfect for use in AI agents, prompt chaining, code analysis, or retrieval-augmented generation.

</details>

---

<details>
<summary>📁 Example Output (llm_txt.txt)</summary>

```

\------------------------ PROJECT TREE ------------------------
.
└── README.md

\------------------------ ./README.md ------------------------

# LLM\_TXT Generator

...

````

</details>

---

<details>
<summary>📜 What is `llm_txt` format?</summary>

The `llm_txt` format is a flat, readable structure used for giving LLMs a complete overview of a project:

✅ All files concatenated into one file
✅ No binary or noisy files
✅ Each section clearly marked
✅ Tree structure as top-level context

> This enables better comprehension by LLMs — especially when used for reasoning, debugging, or interpreting entire codebases.

</details>

---

<details>
<summary>⚙️ How It Works</summary>

1. **Removes** old `llm_txt.txt`
2. **Generates** a tree overview of the project
3. **Finds** all relevant files based on include/exclude rules
4. **Concatenates** all contents into `llm_txt.txt`

</details>

---

<details>
<summary>🛠️ Usage</summary>

Run the script from your terminal:

```bash
bash llm_txt.sh
````

> ⚠️ Make sure you have `tree` installed:

```bash
sudo apt install tree
```

</details>

---

<details>
<summary>🚫 What Gets Excluded?</summary>

**Directories:**

* `.git`
* `.vscode`
* `.qodo`

**Files:**

* `llm_txt.txt`
* `.gitignore`, `kubeconfig`
* The script itself (`llm_txt.sh`)

You can customize the excluded paths in the script.

</details>

---

<details>
<summary>👤 Author</summary>

**Chris Engelhard**
📧 [chris@chrisengelhard.nl](mailto:chris@chrisengelhard.nl)
🌐 [www.chrisengelhard.nl](https://www.chrisengelhard.nl)
🏢 Digi4Care

</details>

---

<details>
<summary>🪪 License</summary>

This project is licensed under the **MIT License**.

</details>

---

<details>
<summary>💡 Ideas or Contributions?</summary>

Suggestions are welcome!

</details>