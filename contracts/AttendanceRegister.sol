// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AttendanceRegister {
    struct Student {
        string name;
        uint class;
    }

    event Added(string name, uint class, uint time);

    mapping (uint => Student) public register; // roll number => student details

    function add (uint rollNumber, string memory name, uint class) public returns (uint256) {
        require(class > 0 && class <= 12, "invalid class");
        require(register[rollNumber].class == 0, "Roll number not available");
        Student memory s = Student(name, class);
        register[rollNumber] = s;

        emit Added(name, class, block.timestamp);
        return rollNumber;
    }

    function getStudentName(uint rollNumber) public view returns(string memory) {
        return register[rollNumber].name;
    }
}