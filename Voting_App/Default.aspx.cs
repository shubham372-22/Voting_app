using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Voting_App
{
    public partial class Votingapp : System.Web.UI.Page
    {
        private VotingEntities db = new VotingEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCandidates();
                BindVoters();
                BindDropDowns();
            }
        }

        private void BindCandidates()
        {
            var candidates = db.Candidates
                .Select(c => new
                {
                    c.CandidateId,
                    c.Name,
                    Votes = db.Votes.Count(v => v.CandidateId == c.CandidateId)
                })
                .ToList();

            gvCandidates.DataSource = candidates;
            gvCandidates.DataBind();
        }

        private void BindVoters()
        {
            gvVoters.DataSource = db.Voters.ToList();
            gvVoters.DataBind();
        }

        private void BindDropDowns()
        {
          
            ddlCandidates.Items.Clear();
            ddlCandidates.Items.Add(new ListItem("I am vote for", ""));
            ddlCandidates.AppendDataBoundItems = true;

            ddlCandidates.DataSource = db.Candidates.ToList();
            ddlCandidates.DataTextField = "Name";
            ddlCandidates.DataValueField = "CandidateId";
            ddlCandidates.DataBind();

           
            ddlVoters.Items.Clear();
            ddlVoters.Items.Add(new ListItem("I am", ""));
            ddlVoters.AppendDataBoundItems = true;

            ddlVoters.DataSource = db.Voters.Where(v => v.HasVoted == false || v.HasVoted == null).ToList();
            ddlVoters.DataTextField = "Name";
            ddlVoters.DataValueField = "VoterId";
            ddlVoters.DataBind();

        }

        protected void btnAddCandidate_Click(object sender, EventArgs e)
        {
            var candidate = new Candidate { Name = txtCandidateName.Text };
            db.Candidates.Add(candidate);
            db.SaveChanges();
            BindCandidates();
            BindDropDowns();
        }

        protected void btnAddVoter_Click(object sender, EventArgs e)
        {
            var voter = new Voter { Name = txtVoterName.Text };
            db.Voters.Add(voter);
            db.SaveChanges();
            BindVoters();
            BindDropDowns();
        }

        protected void btnCastVote_Click(object sender, EventArgs e)
        {
            int candidateId = int.Parse(ddlCandidates.SelectedValue);
            int voterId = int.Parse(ddlVoters.SelectedValue);

            var vote = new Vote { CandidateId = candidateId, VoterId = voterId };
            db.Votes.Add(vote);

            var candidate = db.Candidates.Find(candidateId);
            candidate.Votes += 1;

            var voter = db.Voters.Find(voterId);
            voter.HasVoted = true;

            db.SaveChanges();

            BindCandidates();
            BindVoters();
            BindDropDowns();
        }
      }
}

