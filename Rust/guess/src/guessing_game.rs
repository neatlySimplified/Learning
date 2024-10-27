use std::{cmp::Ordering, io};
use rand::Rng;


pub fn guessing() {
    println!("Guess the number!");

    let secret = rand::thread_rng()
    .gen_range(1..=10);

    println!("The range is from 1 to 10.");

    loop {
        println!("Please input your guess.");

        let mut guess = String::new();

        io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read the line");

        let guess: u32 = match guess
        .trim()
        .parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        match guess.cmp(&secret) {
            Ordering::Equal => {
                println!("You guessed right!");
                break;
            },
            Ordering::Greater => println!("Is less!"),
            Ordering::Less => println!("Is more!")
        }
    }

}