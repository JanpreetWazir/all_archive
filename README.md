# 🔐 Multi-Subdomain BackMeUp

An extended version of the original [Back-Me-Up](https://github.com/Dheerajmadhukar/back-me-up) tool that **automates link collection and sensitive data detection** from multiple subdomains at once — boosting productivity for **bug bounty hunters** and **security researchers**.

---

## 🚀 Highlights

### ✅ What’s New?
- 🔁 **Multi-subdomain support**: Unlike the original Back-Me-Up which accepts only *one subdomain at a time*, this tool takes **multiple subdomains from a file**.
- 🗂️ **Organized Output**: Each subdomain gets its own folder inside the `output/` directory.
- 📜 **Simple Config**: Just modify one variable:  
  ```bash
  SUBDOMAINS_FILE="/home/janpreet/Desktop/project/zerodha/subdomains.txt"
