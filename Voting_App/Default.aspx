<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Voting_App.Votingapp" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Voting App</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2, h3 {
            margin-top: 20px;
            color: #343a40;
        }
        .table thead th {
            text-align: center;
            background-color: #343a40;
            color: #ffffff;
        }
        .table tbody td {
            text-align: center;
        }
         h2 {
    font-size: 3rem;
}
        .form-group {
            margin-bottom: 1rem;
        }
        .btn {
            width: 100%;
        }
        .header {
            background-color: rgba(0, 123, 255, .25);
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 8px 8px 0 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2 class="text-center">Voting App</h2>
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                       <h3>Add Candidate</h3>
                    <div class="form-group">
                        <asp:TextBox ID="txtCandidateName" runat="server" CssClass="form-control" Placeholder="Candidate Name"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddCandidate" runat="server" CssClass="btn btn-primary" Text="Add Candidate" OnClick="btnAddCandidate_Click" />
               
                    <h3>Candidates</h3>
                    <asp:GridView ID="gvCandidates" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="CandidateId" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Votes" HeaderText="Votes" />
                        </Columns>
                    </asp:GridView>
                  </div>
                <div class="col-md-6">
                       <h3>Add Voter</h3>
                    <div class="form-group">
                        <asp:TextBox ID="txtVoterName" runat="server" CssClass="form-control" Placeholder="Voter Name"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddVoter" runat="server" CssClass="btn btn-primary" Text="Add Voter" OnClick="btnAddVoter_Click" />
               
                    <h3>Voters</h3>
                    <asp:GridView ID="gvVoters" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="VoterId" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="HasVoted" HeaderText="Has Voted" />
                        </Columns>
                    </asp:GridView>
                  </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="text-center">Cast Vote</h3>
                    <div class="form-group">
                        <label for="ddlCandidates">Select Candidate:</label>
                        <asp:DropDownList ID="ddlCandidates" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlVoters">Select Voter:</label>
                        <asp:DropDownList ID="ddlVoters" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <asp:Button ID="btnCastVote" runat="server" CssClass="btn btn-success" Text="Cast Vote" OnClick="btnCastVote_Click" />
                </div>
            </div>
        </div>
    </form>
   
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



