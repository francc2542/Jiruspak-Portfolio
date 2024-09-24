# ฟังก์ชั่นสำหรับเกมเป่ายิ่งฉุบ
play_rps <- function() {
  options <- c("rock", "paper", "scissors")
  franc_score <- 0
  player_score <- 0
  
  for (round in 1:10) {
    # คอมพิวเตอร์สุ่มเลือก
    franc_choice <- sample(options, 1)
    
    # ผู้เล่นเลือกหรือป้อน "quit"
    cat("Round", round, "\n")
    cat("Enter your choice (rock, paper, scissors) or type 'quit' to exit: ")
    player_choice <- readline()
    player_choice <- tolower(player_choice)
    
    # ตรวจสอบเงื่อนไขออกเกม
    if (player_choice == "quit") {
      cat("You quit the game.\n")
      break
    }
    
    # ตรวจสอบผลการแข่งขัน
    if (player_choice %in% options) {
      cat("Franc chose:", franc_choice, "\n")
      
      if (player_choice == franc_choice) {
        cat("It's a tie!\n")
      } else if ((player_choice == "rock" & franc_choice == "scissors") |
                 (player_choice == "paper" & franc_choice == "rock") |
                 (player_choice == "scissors" & franc_choice == "paper")) {
        cat("You win!\n")
        player_score <- player_score + 1
      } else {
        cat("Franc wins!\n")
        franc_score <- franc_score + 1
      }
    } else {
      cat("Invalid choice. Please enter 'rock', 'paper', or 'scissors'.\n")
      round <- round - 1  # ไม่นับรอบนี้
    }
  }
  
  # แสดงคะแนนรวม
  cat("\nFinal Scores:\n")
  cat("Player:", player_score, "\n")
  cat("Franc:", franc_score, "\n")
  
  # ผลสรุป
  if (player_score > franc_score) {
    cat("Congratulations! You win the game.\n")
  } else if (player_score < franc_score) {
    cat("Sorry, the Franc wins the game.\n")
  } else {
    cat("It's a draw! No one wins.\n")
  }
}

# เรียกใช้ฟังก์ชั่นสำหรับเล่นเกม
play_rps()
