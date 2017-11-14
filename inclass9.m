% Inclass assignment 9
%GB comments
1) 100
2) 100
3) 100 
4) 100
Overall: 100

% The accession number for human NOTCH1 mRNA is AF308602
% 1. Read the information from this entry into matlab
% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database
% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 
% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 

%1.
hNOTCH1=getgenbank('AF308602');
%2
Seq=hNOTCH1.Sequence(1:500);
[requestID, requestTime]=blastncbi(Seq,'blastn','Database','refseq_rna');
rblast=getblast(requestID,'WaitTime',requestTime);
%3
names1=rblast.Hits(2).Name; s1=2; %Pan Troglodytes
names2=rblast.Hits(6).Name; s2=6; %Rhinopitecus bieti
names3=rblast.Hits(7).Name; s3=7; %Cercocebus atys

l1= rblast.Hits(s1).HSPs(1).Alignment;  %Pan Troglodytes
l2= rblast.Hits(s2).HSPs(1).Alignment;  %Rhinopitecus bieti
l3= rblast.Hits(s3).HSPs(1).Alignment;  %Cercocebus atys

f1=rblast.Hits(s1).HSPs(1).Identities %Pan Troglodytes
f2=rblast.Hits(s2).HSPs(1).Identities %Rhinopitecus bieti
f3=rblast.Hits(s3).HSPs(1).Identities %Cercocebus atys

%4
[requestID4, requestTime4]=blastncbi(Seq,'blastn','Database','est_human');
rblast4=getblast(requestID4,'WaitTime',requestTime4);

%Miguel Angel: All sequences are of human because the database we're blasting is to a the
%human subset of the GenBank EST database. 

rblast4.Hits(1).HSPs.Identities; %this is the highest match with 99% alignment, but with 278 bp of our 500 bp sequence
rblast4.Hits(2).HSPs.Identities; %this is the gives a good alignment = 97% but because it's only comparing 34 bp, which is a really low fraction.
rblast4.Hits(3).HSPs.Identities %from here the comparisons are going lower and lower as the same with the alignments.

%this means that, our sequence is being compared against the closest match
%within the human genome. 

