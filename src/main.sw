contract;

// Import the std lib from sway
use std::*;

// Initialize a storage
// Storage are the way we add persistent state to our contracts
//
// In this case create a storage with property counter and
// initialized in 0
storage {
  counter: u64 = 0,
}

// Define the interface out contract shall have
// In this case;
abi MyContract {
  // A counter method with no params that returns a number
  // and don't write on the storage
  #[storage(read)]fn counter() -> u64;
  // A increment method with a param a number that returns a number
  // and can read and write on the storage
  #[storage(read, write)]fn increment(param: u64) -> u64;
}

// The contract implementation
impl MyContract for Contract {
  #[storage(read)]fn counter() -> u64 {
    // Read and return the counter property value
    // from the contract storage
    storage.counter
  }
  #[storage(read, write)]fn increment(param: u64) -> u64 {
    // Read the counter from storage and increment with
    // the param received
    storage.counter += param;
    // Return the new storage counter value
    storage.counter
  }
}
