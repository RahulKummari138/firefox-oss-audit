# Firefox Open Source Audit | Capstone Project  

**Author:** Kummari Rahul Yadav  
**Roll Number:** 24MEI10048  

---

## 📄 Project Overview

This project is part of the **Open Source Software (OSS) NGMC Course Capstone Project**. It presents a structured audit of **Mozilla Firefox** as an open-source system and demonstrates practical Linux system administration skills using shell scripting.

The audit focuses on understanding Firefox not just as a browser, but as a complete open-source ecosystem.

---

## 🔍 Audit Scope

The project covers the following key areas:

### 1. Origin & Philosophy
- History of Netscape and the Browser Wars  
- Evolution of Mozilla Firefox  
- Mozilla Manifesto and open web principles  

### 2. Licensing
- Detailed study of **Mozilla Public License 2.0 (MPL 2.0)**  
- Comparison with **GPL** and **MIT License**  
- Real-world implications of each license  

### 3. Linux Footprint
- Installation methods (APT, DNF, Snap, Flatpak)  
- Directory structure and file locations  
- File permissions and system integration  

### 4. Ecosystem & Dependencies
- Core technologies: **Gecko Engine**, **Rust**, **SQLite**  
- Role of Firefox in modern web development  
- Integration with Linux environments  

### 5. Critical Analysis
- Comparison with proprietary browsers like **Google Chrome**  
- Privacy, performance, and openness evaluation  

---

## 🛠 Shell Scripts (Section 4)

This repository includes five Bash scripts demonstrating essential Linux concepts:

| Script | Description | Concepts Used |
| :--- | :--- | :--- |
| `script1_system_identity.sh` | Displays system information | Variables, `uname`, `date`, command substitution |
| `script2_foss_inspector.sh` | Checks software installation and license | `if-else`, `case`, package managers (`rpm`/`dpkg`) |
| `script3_disk_auditor.sh` | Analyzes disk usage and permissions | Loops, arrays, `ls`, `du`, `awk` |
| `script4_log_analyzer.sh` | Searches logs for specific patterns | `while read`, counters, `grep`, `tail` |
| `script5_manifesto_gen.sh` | Generates a custom OSS manifesto | User input, heredoc, file handling |

---

## 🚀 Getting Started

### Prerequisites
- Linux OS (Ubuntu, Fedora, or similar)
- Bash shell
- Basic terminal knowledge
- Sudo/root privileges (for some scripts)

---

## ▶️ Installation & Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/firefox-oss-audit.git