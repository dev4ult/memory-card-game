String modeBT;

void setBestTime() {
  switch(gameModeName) {
  case "EASY":
    modeBT = easyBT;
    break;
  case "NORMAL":
    modeBT = normalBT;
    break;
  case "HARD":
    modeBT = hardBT;
    break;
  default:
    println("Unknown Game Mode");
  }
}

void setSaveJSONBT() {
  json = new JSONObject();

  switch(gameModeName) {
  case "EASY":
    json.setString("easy", timeText);
    json.setString("normal", normalBT);
    json.setString("hard", hardBT);
    break;
  case "NORMAL":
    json.setString("easy", easyBT);
    json.setString("normal", timeText);
    json.setString("hard", hardBT);
    break;
  case "HARD":
    json.setString("easy", easyBT);
    json.setString("normal", normalBT);
    json.setString("hard", timeText);
    break;
  default:
    println("Unknown Game Mode");
  }

  saveJSONObject(json, "../data/record.json");
}
