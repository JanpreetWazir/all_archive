# 🔐 Multi-Subdomain BackMeUp

An extended version of the original **Back-Me-Up** tool that **automates link collection and sensitive data detection** from multiple subdomains at once — boosting productivity for **bug bounty hunters** and **security researchers**.

## 🚀 Highlights

### ✅ What's New?

- 🔁 **Multi-subdomain Support**: Unlike the original Back-Me-Up which accepts only *one subdomain at a time*, this version allows you to process **multiple subdomains from a file**.
- 🗂️ **Organized Output**: Each subdomain gets its own folder inside the `output/` directory.
- ⚙️ **Simple Configuration**: Just modify the path to the subdomain file in `script1.sh`:

```bash
SUBDOMAINS_FILE="/path/to/your/subdomains.txt"
```

- ▶️ **One-Command Execution**: After setting permissions, simply run the script:

```bash
chmod +x script1.sh
./script1.sh
```

## 🛠️ Tool Description

Back-Me-Up is a powerful shell script designed to automate the bug bounty process by collecting URLs from internet archives and searching for sensitive data leakage in the form of juicy extensions.

This modified version extends its capability to handle multiple subdomains at once, making it even more efficient and scalable.

## 🧩 How It Works

### 🔎 Step 1: URL Collection
The tool uses a powerful combo of URL gathering utilities:
- `gau`
- `gauplus`
- `waybackurls`
- `cariddi`
- `waymore`
- `gospider`
- `crawley`
- `hakrawler`
- `katana`

### 🔍 Step 2: Extension Filtering
Filters URLs based on sensitive/juicy file extensions such as:
```
.sql, .bak, .env, .log, .db, .txt, .tar.gz, .zip, .conf, .yml, .gz, etc.
```
- Supports **160+ file types** listed in `ext.txt`

### 📁 Step 3: Output Handling
Each subdomain's results are saved in its own folder inside the `output/` directory — fully separated and easy to analyze.

## 📦 Prerequisites & Installation

Don't worry — `backmeup.sh` takes care of everything for you!

### 🔧 Requirements
- **System**: `go`, `git`, `curl`, `pip3`
- **Tools**: 
  - `gau`, `gauplus`
  - `waybackurls`, `waymore`
  - `cariddi`, `gospider`, `katana`
  - `crawley`, `hakrawler`
  - `httpx`, `anew`

### ⚙️ Install All Dependencies Automatically
```bash
bash backmeup.sh --install
```

### ✅ Check Installed Tools
```bash
bash backmeup.sh --check
```

## 🧪 Usage Example

1. **Add subdomains to your file:**
   ```
   /path/to/your/subdomains.txt
   ```

2. **Make the script executable:**
   ```bash
   chmod +x script1.sh
   ```

3. **Run the tool:**
   ```bash
   ./script1.sh
   ```

4. **Review output per subdomain inside:**
   ```
   output/
   ├── subdomain1/
   ├── subdomain2/
   └── ...
   ```

## 📋 File Structure

```
Multi-Subdomain-BackMeUp/
├── script1.sh              # Main execution script
├── backmeup.sh             # Installation and dependency management
├── ext.txt                 # List of 160+ file extensions
├── subdomains.txt          # Your target subdomains (one per line)
└── output/                 # Results directory
    ├── subdomain1/
    ├── subdomain2/
    └── ...
```

## 🔧 Configuration

Edit the `SUBDOMAINS_FILE` path in `script1.sh` to point to your subdomain list:

```bash
SUBDOMAINS_FILE="/path/to/your/subdomains.txt"
```

## 🎯 Target Extensions

The tool searches for sensitive files with extensions including but not limited to:
- **Database**: `.sql`, `.db`, `.sqlite`
- **Configuration**: `.env`, `.conf`, `.yml`, `.yaml`
- **Backups**: `.bak`, `.backup`, `.old`
- **Archives**: `.zip`, `.tar.gz`, `.rar`
- **Logs**: `.log`, `.txt`
- **And 150+ more...**

## 🚨 Disclaimer

This tool is designed for **authorized security testing** and **bug bounty programs** only. Users are responsible for ensuring they have proper authorization before scanning any targets. The developers assume no liability for misuse.

## 🤝 Contributing

Feel free to contribute by:
- Adding new URL gathering tools
- Improving extension detection
- Optimizing performance
- Reporting bugs

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Credits

- Original Back-Me-Up tool developers
- All the amazing tool developers in the bug bounty community
- Contributors to URL gathering utilities

---

**Happy Bug Hunting! 🐛🔍
