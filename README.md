# AUTOMATED-BATTERY-DEFECT-DETECTION-
MATLAB + Simulink project for automated battery inspection using AI and voltage testing"
# 🔋 Battery Inspection Project – MATLAB + Simulink

This project simulates automated battery cell quality inspection using:
- 📷 Image classification (CNN)
- ⚡ Voltage testing (Simulink)
- 🧠 Final inspection logic (MATLAB script)

---

## 🧪 How to Run

1. Open `team_13.slx` in Simulink and click **Run** to simulate voltage test.
2. Run `inspection_code.m` to load the trained model and classify an image.
3. Replace the image path in `inspection_code.m` to test other cells.

---

## 📁 Folder Structure

- `team_13.slx` – Voltage inspection logic (Simulink)
- `trainedNet.mat` – Trained CNN model
- `inspection_code.m` – Final logic combining image + voltage
- `BATTERY/` – Dataset with `healthy/` and `damaged/` images

---

## 🚀 Demo Output

```matlab
✅ Voltage Test: PASS
✅ Image Inspection: HEALTHY
✅ FINAL RESULT: Battery Pack PASSED Quality Check ✅
