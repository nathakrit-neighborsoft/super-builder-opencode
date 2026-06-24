# Super Builder Agent สำหรับ OpenCode

[Read in English](README.md)

`super-builder` คือโปรไฟล์ Agent สำหรับ OpenCode ที่ออกแบบมาเพื่อทีมและนักพัฒนาที่ต้องการ Workflow การทำงานแบบ Superpowers-driven อย่างเคร่งครัด Agent ตัวนี้จะสวมบทบาทเป็น Senior Engineer ที่เน้นความเรียบง่าย (Lazy but strong taste) บังคับใช้การเปลี่ยนแปลงโค้ดให้น้อยที่สุด มีการวางแผนที่ชัดเจน และใช้หลักการเขียนโค้ดสไตล์ Karpathy

## สิ่งที่มีในโปรเจกต์นี้

- `agent.md`: โปรไฟล์หลักของ OpenCode Agent ที่ใช้ควบคุม Workflow
- **Core Workflow Enforcement**: โหลด Skills ที่จำเป็นอัตโนมัติเมื่อเริ่มงานใหม่ (`caveman`, `ponytail`, `brainstorming`, `guidelines`)
- **Model Selection Gate**: เลือกรุ่น AI ให้เหมาะสมกับงานอัตโนมัติ และสอบถามผู้ใช้เมื่อเป็นงานที่ซับซ้อน
- **Strict Planning**: บังคับให้มีการสร้างและอนุมัติแผนงาน (Plan) ก่อนเริ่มเขียนโค้ดเสมอ
- **Context Management**: รองรับการทำงานร่วมกับ CodeGraph เพื่ออัปเดต Context ของโปรเจกต์ และ Headroom MCP เพื่อบีบอัด Context

## ความต้องการของระบบ

- ต้องติดตั้ง [OpenCode](https://opencode.ai/)
- สำหรับ macOS, Linux, หรือ Git Bash ต้องมี `curl` หรือ `wget` ในการรันสคริปต์ติดตั้ง
- สำหรับ Windows ให้รันสคริปต์ติดตั้งผ่าน PowerShell

## การติดตั้ง

สคริปต์ติดตั้งจะทำการดาวน์โหลด Agent และ Skills ที่จำเป็นเหล่านี้ให้โดยอัตโนมัติ:
- `caveman`
- `ponytail`
- `brainstorming`
- `guidelines`
- `grill-design`
- `create-plan`
- `subagent-driven-development`

### macOS, Linux, หรือ Git Bash

```sh
curl -fsSL https://raw.githubusercontent.com/nathakrit-neighborsoft/super-builder-opencode/main/install.sh | sh
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/nathakrit-neighborsoft/super-builder-opencode/main/install.ps1 | iex
```

## ตำแหน่งที่ติดตั้ง

โดยค่าเริ่มต้น สคริปต์จะติดตั้งไฟล์ลงในโฟลเดอร์ config หลักของ OpenCode ตามระบบปฏิบัติการของคุณ:

- macOS, Linux, หรือ Git Bash: `~/.config/opencode`
- Windows PowerShell: `%APPDATA%\opencode`

OpenCode จะโหลด Agent จากโฟลเดอร์ `agents/` และโหลด Skills จากโฟลเดอร์ `skills/` ใน config directory นี้ โดยสคริปต์จะบันทึกไฟล์ Agent ในชื่อ `super-builder.md`

## การอัปเดต

หากต้องการอัปเดต ให้รันคำสั่งติดตั้งเดิมอีกครั้ง สคริปต์จะดาวน์โหลดไฟล์เวอร์ชันล่าสุดมาทับไฟล์เดิมทันทีโดยไม่มีการสร้างไฟล์สำรอง (Backup)

## การใช้งาน

หลังจากติดตั้งเสร็จแล้ว คุณสามารถเลือกใช้ Agent `super-builder` ใน OpenCode ได้ทันที โดย Agent จะนำทางคุณตาม Workflow ดังนี้:

1. **Brainstorming & Clarification**: สอบถามเพื่อทำความเข้าใจเป้าหมายของงาน
2. **Model Selection**: สอบถามเพื่อเลือก Model ที่จะใช้สำหรับการวางแผน (Planning) และการเขียนโค้ด (Implementation)
3. **Planning**: สร้างแผนงานที่ชัดเจนเพื่อให้คุณอนุมัติ
4. **Implementation**: ลงมือเขียนโค้ดตามแผนที่วางไว้ (ผ่าน Subagents หรือแก้โค้ดโดยตรง)
5. **Verification**: ตรวจสอบความถูกต้องของโค้ดก่อนจบงาน

## License

โปรเจกต์นี้เผยแพร่ภายใต้ MIT License
