

 function Ctrl($scope) {
       $scope.userResearchs =
          [ {   icon: 'fa fa-dot-circle-o',
                phase: 'Overview',
                name: 'User-Centered Design',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. Nam viverra eget odio non blandit. Phasellus condimentum, elit in lacinia scelerisque, mauris velit sollicitudin arcu, ac suscipit ipsum felis vitae arcu. Cras a malesuada libero. Proin eget dolor ante. ',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'a good practices is bla bla bla consectetur adipiscing elit. Quisque auctormagna ullamcorper faucibus vehicula',
                example: 'example'},

            {   icon: 'fa fa-search',
                phase: 'Overview',
                name: 'User Research',
                description: 'Sit amet, consectetur adipiscing elit. Nam viverra eget odio non blandit. Phasellus condimentum, elit in lacinia scelerisque, mauris velit sollicitudin arcu, ac suscipit ipsum felis vitae arcu. Cras a malesuada libero. Proin eget dolor ante. ',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'a good practices is bla bla bla consectetur adipiscing elit. Quisque auctormagna ullamcorper faucibus vehicula',
                example: 'example'},

            {   icon: 'fa fa-lightbulb-o',
                phase: 'Overview',
                name: 'Prototyping',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. Nam viverra eget odio non blandit. Phasellus condimentum, elit in lacinia scelerisque, mauris velit sollicitudin arcu, ac suscipit ipsum felis vitae arcu. Cras a malesuada libero. Proin eget dolor ante. ',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'a good practices is Quisque auctormagna ullamcorper faucibus vehicula',
                example: 'example'},

            {   icon: 'fa fa-check',
                phase: 'Overview',
                name: 'Evaluation',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. Nam viverra eget odio non blandit. Phasellus condimentum, elit in lacinia scelerisque, mauris velit sollicitudin arcu, ac suscipit ipsum felis vitae arcu. Cras a malesuada libero. Proin eget dolor ante. ',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'a good practices is bla bla bla auctormagna ullamcorper faucibus vehicula',
                example: 'example'},

            {   icon: 'fa fa-user',
                phase: 'User Research',
                name: 'Persona',  
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. Nam viverra eget odio non blandit. Phasellus condimentum, elit in lacinia scelerisque, mauris velit sollicitudin arcu, ac suscipit ipsum felis vitae arcu. Cras a malesuada libero. Proin eget dolor ante. ',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'a good practices is bla bla bla consectetur adipiscing elit. Quisque auctormagna ullamcorper faucibus vehicula',
                example: 'example'},

             {  icon: 'fa fa-eye',
                phase: 'User Research',
                name: 'Observation',
                description: 'Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                benefits: 'benefits of observation',
                bestPractices : 'Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                example: 'example'},

            {   icon: 'fa fa-group',
                phase: 'User Research',
                name: 'Focus group',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                bestPractices : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                example: 'example'},

            {  icon: 'fa fa-pencil',
                phase: 'Prototyping',
                name: 'Sketch',
                description: 'Quisque auctor, magna ullamcorper faucibus vehicula. Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                benefits: 'benefits of dictum sapien, eget gravida lectus justo',
                bestPractices : 'Enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                example: 'example'},

            {  icon: 'fa fa-pencil-square-o',
                phase: 'Prototyping',
                name: 'High-fidelity',
                description: 'Quisque auctor, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                benefits: 'benefits of dictum sapien, eget gravida lectus justo',
                bestPractices : 'Enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                example: 'example'},

            {  icon: 'fa fa-comment-o',
                phase: 'Evaluation',
                name: 'Think-aloud ev.',
                description: 'Quisque auctor, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                benefits: 'benefits of dictum sapien, eget gravida lectus justo',
                bestPractices : 'Enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                example: 'example'},

            {  icon: 'fa fa-list-ol',
                phase: 'Evaluation',
                name: 'Heuristic ev.',
                description: 'Magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus.  Quisque auctor, magna ullamcorper faucibus vehicula, enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                benefits: 'benefits of dictum sapien, eget gravida lectus justo, enim dui dictum sapien.',
                bestPractices : 'Enim dui dictum sapien, eget gravida lectus justo nec lectus. ',
                example: 'example'},


        ];

 }

