SELECT Status, 
       IssueDate 
FROM   Jobs 
WHERE  STATUS <> 'Finished' 
ORDER  BY IssueDate, 
          JobId 