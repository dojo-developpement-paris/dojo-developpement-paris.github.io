use std::io;

const YELLOW_PAWN: &str = "X";
const RED_PAWN: &str = "O";
const EMPTY: &str = "-";

fn main() -> io::Result<()> {
    let mut color = "Yellow";
    let mut grid: [[&str; 7]; 6] = [
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY],
    ];
    loop {
        println!("1 2 3 4 5 6 7");
        println!("{}", grid.map(|line| { line.join(" ") }).join("\n"));
        println!("{color}, choose a column:");

        let mut entry = String::new();
        io::stdin()
            .read_line(&mut entry)
            .expect("Failed to read line");

        match entry.trim().parse::<usize>() {
            Ok(column) if column > 0 && column < 8 => {
                println!("Wow, nice");
                if grid[5][column - 1] == EMPTY {
                    let height = first_empty(grid, column);
                    grid[height][column - 1] = if color == "Yellow" {
                        YELLOW_PAWN
                    } else {
                        RED_PAWN
                    };
                } else {
                    grid[4][column - 1] = if color == "Yellow" {
                        YELLOW_PAWN
                    } else {
                        RED_PAWN
                    };
                }
                color = if color == "Yellow" { "Red" } else { "Yellow" };
            }
            _ => {
                println!("Nan nan reviens demain");
            }
        }
    }
}
fn first_empty(grid: [[&str; 7]; 6], column: usize) -> usize {
    // TODO: ask Claude to finish for us
    //grid.iter().find_index(|line| line[column - 1] != EMPTY)
    5
}
