CREATE TABLE Candidates (
    CandidateId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Votes INT DEFAULT 0
);

CREATE TABLE Voters (
    VoterId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    HasVoted BIT DEFAULT 0
);

CREATE TABLE Votes (
    VoteId INT PRIMARY KEY IDENTITY(1,1),
    CandidateId INT,
    VoterId INT,
    FOREIGN KEY (CandidateId) REFERENCES Candidates(CandidateId),
    FOREIGN KEY (VoterId) REFERENCES Voters(VoterId)
);


This is Query FOr Database SQl Server.
This Project is Voting App.
