const PERSONNAL_ACCESS_TOKEN = "53ba72dc7a8288724f96c85941a11ec5b8fa82d4";

const query = `
{
  repository(owner: "dojo-developpement-paris", name: "dojo-developpement-paris.github.io") {
    url
    refs(refPrefix: "refs/heads/", first: 10, orderBy: {field: ALPHABETICAL, direction: DESC}) {
      nodes {
        name
      }
    }
  }
}
`;

const dojoBranch = /^\d{4}-\d{2}-\d{2}$/;

async function getResult() {
  const response = await fetch("https://api.github.com/graphql", {
    method: "POST",
    body: JSON.stringify({ query }),
    headers: {
      Authorization: `bearer ${PERSONNAL_ACCESS_TOKEN}`
    }
  });

  return response.json();
}

function getLastBranchName(repository) {
  const branchesName = repository.refs.nodes
    .map(node => node.name)
    .filter(name => dojoBranch.test(name));
  return branchesName[0];
}

function formatURL(repositoryURL, branchName) {
  return `${repositoryURL}/tree/${branchName}`;
}

async function redirectToLastBranch() {
  try {
    const result = await getResult();
    const { repository } = result.data;
    const branchName = getLastBranchName(repository);
    const url = formatURL(repository.url, branchName);
    window.location.assign(url);
  } catch (ex) {
    console.error(ex);
    alert("Oups ! Problème technique\nPlus d'infos dans la console");
  }
}
