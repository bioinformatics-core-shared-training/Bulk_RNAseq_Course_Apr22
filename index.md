# Introduction to Bulk RNA-seq data analysis
### 17th, 24th February and 3rd March 2022
#### Taught remotely
#### Bioinformatics Training, Craik-Marshall Building, Downing Site, University of Cambridge

![](Bulk_RNAseq_Course_Base/images/CRUK_Cambridge_Major_Centre_logo.jpg)

## Instructors

* Abigail Edwards - Bioinformatics Core, Cancer Research UK Cambridge Institute
* Ashley D Sawle - Bioinformatics Core, Cancer Research UK Cambridge Institute
* Jon Price - Miska Group, Gurdon Institute, Cambridge
* Hugo Tavares - Bioinformatics Training Facility, Dept of Genetics
* Chloe Pacyna - Welcome Sanger Institute
* Sankari Nagarajan - University of Manchester
* Carolin Sauer - Brenton Group, Cancer Research UK Cambridge Institute
* Tom Smith - Bioinformatics Faciltiy, MRC Toxicology Unit, Cambridge


## Outline

In this workshop, you will be learning how to analyse RNA-seq data. This will
include read alignment, quality control, quantification against a reference,
reading the count data into R, performing differential expression analysis, and
gene set testing, with a focus on the DESeq2 analysis workflow. You will learn
how to generate common plots for analysis and visualisation of gene expression
data, such as boxplots and heatmaps.

This workshop is aimed at biologists interested in learning how to perform
differential expression analysis of RNA-seq data.

Whilst we have run this course for several years, we are still learning how to
teach it remotely and this is the first time split over three weeks.  
Please bear with us if there are any technical hitches, and
be aware that timings for different sections laid out in the schedule below may
not be adhered to. There may be some necessity to make adjustments to the course
as we go.

> ## Prerequisites
>
> __**Some basic experience of using a UNIX/LINUX command line is assumed**__
>
> __**Some R knowledge is assumed and essential. Without it, you
> will struggle on this course.**__
> If you are not familiar with the R statistical programming language we
> strongly encourage you to work through an introductory R course before
> attempting these materials.
> We recommend our [Introduction to R course](https://bioinformatics-core-shared-training.github.io/r-intro/)

## Shared Google Document

This
[Google Document](https://docs.google.com/document/d/1minSG0F72YCeObH9jntjZO1DgLF8jsyzu23hdJP5tZ8/edit) contains useful information and links..

Please use it to post any questions you have during the course.

The trainers will be monitoring the document and will answer questions as quickly
as they can.

## Introduce Yourself

There is another Google Doc
[Google Document](https://docs.google.com/document/d/16W723pDWTUAsTmsjF29L3bOTxIv7i3NVAr1ST1ugPfk/edit)
Please write a couple sentences here to introduce yourself to the class, tell
us a bit about your background and what you hope to get out of this course.  If
you are a student or staff at the University of Cambridge, tell us which
Department you are in.


## Course etiquette

As this course is being taught online and there are a large number of participants,
we will all need to follow a [few simple rules](https://docs.google.com/presentation/d/e/2PACX-1vQv9nTlsdRC9iZJU138tLL1jrwNoryp8P-FnXxb_ugOOWjbav4QHTLYLLZj2KK4kTO0_3x3VlzSdrUu/pub?start=false&loop=false&delayms=3000) to ensure things run as smoothly as possible:

1. Please mute your microphone

2. To get help from a tutor, please click the "Raise Hand" button in Zoom:

    ![](Bulk_RNAseq_Course_Base/images/raise_hand.png)

   This can be found by clicking on the 'Participants' button. A tutor will
   then contact you in the chat. If necessary, you and the tutor can be moved
   to a breakout room where you can discuss your issue in more detail.

3. Please ask any general question by typing it into the Google Doc mentioned above

4. During practicals, when you are done, please press the green "Yes" button:

    ![](Bulk_RNAseq_Course_Base/images/yes_button.png)

   This way we will know when we can move on.

## Timetable

**We are still learning how to teach this course remotely, all times here should be
regarded as aspirations**

### Day 1

9:30 - 9:45 - Welcome! <!-- Abbi -->

9:45 - 10:15 - [Introduction to RNAseq
Methods](Bulk_RNAseq_Course_Base/Markdowns/01_Introduction_to_RNAseq_Methods.html) - Sankari Nagarajan

10:15 - 11:15 [Raw read file format and
QC](Bulk_RNAseq_Course_Base/Markdowns/02_FastQC_introduction.html)  - Jon Price  
    - [Practical](Bulk_RNAseq_Course_Base/Markdowns/02_FastQC_practical.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/02_FastQC_practical.pdf))   
    - [Practical solutions](Bulk_RNAseq_Course_Base/Markdowns/02_FastQC_practical.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/02_FastQC_practical.Solutions.pdf))  

11:15 - 12:45 [Short read alignment with
HISAT2](Bulk_RNAseq_Course_Base/Markdowns/03_Alignment_with_HISAT2_introduction.html) - Jon Price  
    - [Practical](Bulk_RNAseq_Course_Base/Markdowns/03_Alignment_with_HISAT2_practical.html)  ([pdf](Bulk_RNAseq_Course_Base/Markdowns/03_Alignment_with_HISAT2_practical.pdf))    
  - [Practical solutions](Bulk_RNAseq_Course_Base/Markdowns/03_Alignment_with_HISAT2_practical.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/03_Alignment_with_HISAT2_practical.Solutions.pdf))

12:45 - 13:45 Lunch

13:45 - 15:30 [QC of alignment](Bulk_RNAseq_Course_Base/Markdowns/04_QC_of_aligned_reads_introduction.html) - Jon Price  
    - [Practical](Bulk_RNAseq_Course_Base/Markdowns/04_QC_of_aligned_reads_practical.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/04_QC_of_aligned_reads_practical.pdf))  
  - [Practical solutions](Bulk_RNAseq_Course_Base/Markdowns/04_QC_of_aligned_reads_practical.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/04_QC_of_aligned_reads_practical.Solutions.pdf))

15:30 - 17:00 [Quantification of Gene Expression with Salmon](Bulk_RNAseq_Course_Base/Markdowns/05_Quantification_with_Salmon_introduction.html) - Ashley D Sawle  
    - [Practical](Bulk_RNAseq_Course_Base/Markdowns/05_Quantification_with_Salmon_practical.html)  ([pdf](Bulk_RNAseq_Course_Base/Markdowns/05_Quantification_with_Salmon_practical.pdf))  
    - [Practical solutions](Bulk_RNAseq_Course_Base/Markdowns/05_Quantification_with_Salmon_practical.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/05_Quantification_with_Salmon_practical.Solutions.pdf))

### Day 2

9:30 - 10:15  [Introduction to RNAseq Analysis in
R](Bulk_RNAseq_Course_Base/Markdowns/06_Introduction_to_RNAseq_Analysis_in_R.html) - Sankari Nagarajan  

10:15 - 12:15 - [RNA-seq
Data Exploration](Bulk_RNAseq_Course_Base/Markdowns/07_Data_Exploration.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/07_Data_Exploration.pdf)) - Abbi Edwards   
   - [Practical solutions](Bulk_RNAseq_Course_Base/Markdowns/07_Data_Exploration.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/07_Data_Exploration.Solutions.pdf))   
    [Live script](live_scripts/DataExploration.R)

12:15 - 13:15 Lunch

13:15 - 15:45 Statistical Analysis of Bulk RNAseq Data

- Part I: [Statistics of RNA-seq analysis](https://docs.google.com/presentation/d/1cQmJ41AC7Xw2kvt5xiJBIHU4uqJonjH0TNURUkzWZCQ/edit?usp=sharing) - Ashley D Sawle

- Part II: [Linear Models in R and DESeq2](Bulk_RNAseq_Course_Base/Markdowns/09_Linear_Models.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/09_Linear_Models.pdf)) - Ashley D Sawle  
    - [Slides](https://docs.google.com/presentation/d/1FTP_gdOQ7sBQWZqTbkB97uUzZ57O9FTyVTgfQrqHPeg/edit?usp=sharing) <!-- ([live whiteboard used during lecture](https://jamboard.google.com/d/1lWsGcrH6uihB0A9OIIZ9P-DbdrS2oUOZPl2EdpcZGJM/edit?usp=sharing)) -->
    - Find the worksheet in `Course_Materials/stats/models_in_r_worksheet.R`


15:45 - 17:00 - [Differential Expression for RNA-seq - Part 1](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2_part1.html)
([pdf](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2_part1.pdf)) - Abbi Edwards
- [Live script](live_scripts/DESeq2_part1.R)

### Day 3

9.30 - 10.00 - [Recap of Day 1 and 2](https://docs.google.com/presentation/d/15Nz5Kv5uMOG96ai6cZ06igMuYlCd3Rm6Ls071nOMZyc/edit?usp=sharing) - Ashley D Sawle

10.00 - 12:00 - [Differential Expression for RNA-seq - Part 2](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2_part2.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2_part2.pdf)) - Abbi Edwards   
   - [practical solutions](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2.Solutions.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/10_DE_analysis_with_DESeq2.Solutions.pdf))  
     - [live script](live_scripts/DESeq2_part2.R)
     - [extra models plots](Bulk_RNAseq_Course_Base/additional_scripts_and_materials/Expl_all.pdf)

12.00 - 12.45 [Annotation and Visualisation of RNA-seq results](Bulk_RNAseq_Course_Base/Markdowns/11_Annotation_and_Visualisation.html) - Ashley D Sawle

12.45 - 13.45 Lunch

13.45 - 15.00 [Annotation and Visualisation of RNA-seq
results](Bulk_RNAseq_Course_Base/Markdowns/11_Annotation_and_Visualisation.html) ([pdf](Bulk_RNAseq_Course_Base/Markdowns/11_Annotation_and_Visualisation.pdf)) - Ashley D Sawle   
  <!-- - [practical solutions](Bulk_RNAseq_Course_Base/Markdowns/11_Annotation_and_Visualisation_Solutions.html)   -->
  <!-- - [live script](live_scripts/day3_vis_anno_v1.0.R) -->

15:00 - 17:00 [Gene-set testing](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing_introduction.html) - Ashley D Sawle
   - [Practical (html)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.html) [(rmd)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.Rmd) [(pdf)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.pdf)
<!--   - [Practical solutions (html)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.Solutions.html) [(rmd)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.Solutions.Rmd) [(pdf)](Bulk_RNAseq_Course_Base/Markdowns/12_Gene_set_testing.Solutions.pdf) -->

<!-- Goodbye: Abbi -->

## Source Materials for Practicals

The lecture slides and other source materials, including R code and
practical solutions, can be found in the course's [Github
repository](https://github.com/bioinformatics-core-shared-training/Bulk_RNASeq_Course_Nov21)

## Extended materials

The [Extended Materials](Extended_index.md) contain extensions to some of the
sessions and additional materials, including instruction on downloading and
processing the raw data for this course, a link to an excellent R course, and
where to get further help after the course.

## Additional Resources

* [Bioconductor for relevant R packages](https://bioconductor.org/)
* [DESeq2 Vignette](https://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html)  
* [RNAseq Workflow](http://master.bioconductor.org/packages/release/workflows/vignettes/rnaseqGene/inst/doc/rnaseqGene.html)  
* [RStudio CheatSheets](https://rstudio.com/resources/cheatsheets/)

## Acknowledgements

This course is based on the course [RNAseq analysis in
R](http://combine-australia.github.io/2016-05-11-RNAseq/) prepared by [Combine
Australia](https://combine.org.au/) and delivered on May 11/12th 2016 in
Carlton. We are extremely grateful to the authors for making their materials
available; Maria Doyle, Belinda Phipson, Matt Ritchie, Anna Trigos, Harriet
Dashnow, Charity Law.

![](Bulk_RNAseq_Course_Base/images/combine_banner_small.png)

The materials have been rewritten/modified/corrected/updated by various
contributors over the past 5 years including:

Abigail Edwards
Ashley D Sawle
Chandra Chilamakuri
Dominique-Laurent Couturier
Guillermo Parada González
Hugo Tavares
Jon Price
Mark Dunning
Mark Fernandes
Oscar Rueda
Sankari Nagarajan
Stephane Ballereau
Zeynep Kalender Atak

Apologies if we have missed anyone!
