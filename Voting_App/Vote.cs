//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Voting_App
{
    using System;
    using System.Collections.Generic;
    
    public partial class Vote
    {
        public int VoteId { get; set; }
        public Nullable<int> CandidateId { get; set; }
        public Nullable<int> VoterId { get; set; }
    
        public virtual Candidate Candidate { get; set; }
        public virtual Voter Voter { get; set; }
    }
}