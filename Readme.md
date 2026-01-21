# PDF Auto compressor

Functionally, this is a program to compress large PDF files based on ghostscript. It's intended use is to be a privacy local first solution. It will scan the data/raw folder and process any and all files there and create compressed copies in the data/output folder inside their own new directories named after {timestamp}_filename/ with filenames relating to their compression model.

## Algorithm
1. Put any number of PDF files to compress in the input directory.
2. Once properly setup the tool will use a cron job to scan the input/ directory periodically (every hour as basis) and mv all files to the data/raw directory.
3. A second cron job will scan the data/raw/ directory and activate the pipeline.sh script to process and compress any and all PDF files in this directory by using a sequence of scripts to compress and move files.
4. Compressed versions of the PDF files will be moved to subdirectories with the convention of {timestamp}_{filename} inside the data/output directory with their own log files.
5. All log files will be copied to the data/logs/ directory as part of the quality control process but all files will have a copy of their logs in their own directories to simplify root cause analysis.
**Key Deliverables:**
- Flowchart
- UML Use Case diagram
- Functional app v1: ghostscript based bash script
- Functional app v2: docker based solution
- AWS S3 conversion plan
- Blog series focused on the progressive building describing the solution.

**Timeline:** Break the project into 3-5 smaller phases with rough deadlines (even if self-imposed)  
- Phase 1: Outline - DONE
- Phase 2: Initial Draft/Prototype — 260121
- Phase 3: Revisions & Refinement — 260124
    This phase focuses on the part of the project that I have the least practice with: AWS. It focuses mostly on converting this prototype from the docker form to an S3 bucket compatible. Alternatively, I could try to add this to EKS/ECS as its already a container... maybe a separate project?
- Phase 4: Final Presentation or Upload 260201
    This phase focuses more on the blog project as a presentation medium than the prototypes itself.
**Resources Needed:** 
- Tools: Bash for execution environment, ghostscript as PDF processor and docker as container environment.
- Knowledge: Functional command of Bash for scripting, docker container creation, AWS for later refinement.

**Potential Obstacles:** What might trip you up? How will you handle procrastination, distractions, or skill gaps?
- Psychological blockage increasing S3 complexity purely in my mind.
- Time: need to timeblock this around my job
- Skill gaps: I am going to 